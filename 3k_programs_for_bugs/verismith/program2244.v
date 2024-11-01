module top
#(parameter param49 = (^~(^~((^(~&(8'ha5))) & ({(8'hb6), (8'ha8)} ? (8'hb3) : (|(7'h43)))))), 
parameter param50 = {((((~|param49) ? ((8'hbf) || param49) : {(8'haf)}) ~^ ((param49 ? param49 : param49) ? (param49 && param49) : (param49 ? param49 : param49))) ? (~&((param49 ? param49 : param49) | (param49 ^~ param49))) : (-((param49 ? param49 : param49) ? param49 : {(8'ha2)}))), {(~|(~{param49}))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire48,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire8,
                 wire7,
                 wire6,
                 reg47,
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
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {wire3[(2'h3):(2'h3)]};
      reg5 <= $signed(wire2[(1'h0):(1'h0)]);
    end
  assign wire6 = wire3;
  assign wire7 = {($unsigned(($signed(wire2) ?
                             (wire2 ?
                                 wire6 : (8'hbc)) : wire3[(4'hf):(4'he)])) ?
                         $signed($unsigned((+wire2))) : (((wire6 ^~ wire6) ^~ $unsigned((8'hbe))) ?
                             reg4[(2'h3):(2'h2)] : ((7'h44) << {wire6})))};
  assign wire8 = wire2[(5'h10):(4'hd)];
  always
    @(posedge clk) begin
      reg9 <= $signed(wire7[(3'h5):(1'h0)]);
      reg10 <= (~^wire3[(4'ha):(4'h8)]);
      reg11 <= ($unsigned(wire3) >= (reg5 ?
          (($unsigned(wire7) <= (-wire3)) ?
              $signed(wire8[(3'h4):(2'h3)]) : $unsigned((wire2 - wire8))) : $unsigned($signed((reg9 ?
              (8'ha1) : reg4)))));
      if ((reg9[(3'h5):(2'h3)] ?
          $signed(wire6[(3'h7):(3'h6)]) : $unsigned($signed(wire8))))
        begin
          reg12 <= (~($unsigned((|(8'hab))) >= $unsigned((|(reg4 ?
              wire0 : wire1)))));
          if (reg4)
            begin
              reg13 <= (~$unsigned($signed(reg4)));
            end
          else
            begin
              reg13 <= $unsigned($unsigned((|((wire2 ? wire1 : reg13) ?
                  (wire3 || wire8) : (reg10 ? wire8 : reg11)))));
              reg14 <= ($signed((&$unsigned(wire7))) && wire1[(4'ha):(2'h2)]);
              reg15 <= $signed((^~wire8[(2'h3):(1'h0)]));
              reg16 <= (((((|(8'ha0)) ? {wire2, wire3} : $unsigned(wire7)) ?
                      $signed(reg10) : $unsigned(reg10[(2'h3):(2'h2)])) - {((^~(8'haf)) ?
                          $signed(reg9) : reg4),
                      reg12[(1'h1):(1'h0)]}) ?
                  ((7'h42) ?
                      (reg15[(3'h5):(2'h2)] >>> $unsigned(wire0)) : {reg11,
                          (|$signed((8'ha7)))}) : (8'hb3));
              reg17 <= (((reg16 ?
                  $signed((wire3 <= (8'ha1))) : (|$signed(reg12))) || {$unsigned(reg10[(1'h1):(1'h1)]),
                  wire2}) != reg13[(3'h4):(2'h2)]);
            end
          if ($unsigned((8'hbd)))
            begin
              reg18 <= ($signed(reg15) ?
                  (8'ha9) : $unsigned(reg15[(4'h9):(3'h6)]));
              reg19 <= ($signed((~$signed((reg18 >> reg14)))) | $unsigned((~|{reg18})));
              reg20 <= $unsigned(reg5);
              reg21 <= $unsigned($signed(($unsigned($unsigned(reg20)) ?
                  (8'ha2) : ({wire3} ?
                      (wire2 ? reg17 : wire8) : ((7'h42) ? reg9 : wire0)))));
            end
          else
            begin
              reg18 <= ($unsigned((^~$signed(reg17))) ?
                  wire7 : $signed($unsigned(({(8'hbb), reg21} ?
                      (|wire2) : $signed(reg17)))));
              reg19 <= (wire6 ?
                  wire6[(2'h2):(1'h0)] : $signed((reg13[(2'h2):(1'h1)] ?
                      (&(~(8'ha9))) : ($unsigned(reg11) ^~ $signed(reg11)))));
              reg20 <= ($unsigned((^{$unsigned(reg20),
                  (reg11 ? reg15 : reg13)})) == wire2);
            end
          reg22 <= ($signed($unsigned((reg19 ? (~|wire6) : reg16))) ?
              $unsigned((({(8'hb0),
                  reg17} < $unsigned(reg12)) | ($signed(reg19) ?
                  wire6[(4'hb):(1'h0)] : $signed(wire8)))) : reg21);
        end
      else
        begin
          reg12 <= (~&wire6[(3'h7):(2'h3)]);
        end
    end
  assign wire23 = reg5[(3'h4):(2'h3)];
  assign wire24 = (reg11[(4'ha):(4'ha)] ?
                      $unsigned($unsigned(wire7)) : $signed(wire23));
  assign wire25 = $unsigned($signed(reg11));
  assign wire26 = $unsigned((^(+wire24[(3'h5):(2'h3)])));
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned({(reg11 ? wire23 : wire23)}) ?
          reg16[(2'h3):(1'h0)] : $unsigned({(reg20 ? reg17 : reg20)}))))
        begin
          reg27 <= (^~$unsigned((reg10 << (|$unsigned(reg5)))));
        end
      else
        begin
          if ((8'ha5))
            begin
              reg27 <= ((wire25[(1'h1):(1'h1)] ? reg19[(3'h7):(2'h3)] : reg10) ?
                  wire23[(2'h2):(1'h1)] : $signed($unsigned(reg22)));
              reg28 <= {reg21[(4'ha):(4'h8)]};
              reg29 <= wire24[(3'h5):(3'h4)];
              reg30 <= (((((reg27 ? wire2 : reg22) ?
                          (reg17 >> wire25) : (|reg4)) ?
                      (!(wire23 >= wire0)) : wire1) ?
                  (8'hbe) : wire6[(4'hd):(4'hd)]) > reg14[(1'h0):(1'h0)]);
              reg31 <= (!((((wire0 && reg17) ?
                      (reg11 ? reg4 : reg18) : {reg29,
                          wire8}) << (wire7 ^ $unsigned(wire3))) ?
                  wire7 : reg18));
            end
          else
            begin
              reg27 <= (&$unsigned((((reg10 >= reg19) ?
                      (~^(8'hb2)) : $unsigned((8'had))) ?
                  $signed((reg14 < (8'ha4))) : wire3[(5'h11):(3'h7)])));
              reg28 <= reg29;
            end
        end
      reg32 <= ({(~((wire6 + reg16) ^~ (~|reg18)))} >= ((reg22 > reg4[(2'h2):(2'h2)]) && reg18[(4'hc):(3'h7)]));
      if ($signed(wire1[(4'hc):(1'h0)]))
        begin
          reg33 <= ({$unsigned((reg21 << $signed(reg29)))} ?
              wire0 : ((-reg21) ?
                  ((wire3[(3'h4):(2'h3)] ? $unsigned(wire8) : (~|reg21)) ?
                      {{reg20, wire0},
                          (reg31 ? reg29 : reg12)} : $unsigned(((8'hbe) ?
                          reg19 : wire6))) : (($signed(reg11) ?
                          {(8'hb6), wire26} : wire3) ?
                      $unsigned((reg30 ? reg17 : reg19)) : (~&(&(8'ha2))))));
          reg34 <= ({$signed(reg5)} ?
              reg27 : ($signed((wire26[(4'ha):(2'h3)] ?
                  (reg13 ?
                      wire0 : wire26) : wire7[(2'h3):(2'h2)])) != $unsigned(((reg27 ^~ wire3) < $unsigned(reg33)))));
          if (reg10)
            begin
              reg35 <= reg34;
              reg36 <= (((wire6 ? reg30 : wire2[(3'h4):(3'h4)]) * (8'hb0)) ?
                  {(~reg11[(4'h9):(3'h7)])} : reg4);
              reg37 <= (!reg5[(2'h2):(1'h0)]);
              reg38 <= (!$signed(($signed($unsigned(reg31)) > (~|reg18[(4'hc):(4'hc)]))));
              reg39 <= ((~^wire1) < $unsigned({(~&(^~reg31))}));
            end
          else
            begin
              reg35 <= (|$unsigned($signed($unsigned((8'hb7)))));
              reg36 <= $signed((+($signed(reg13) ?
                  ((^(8'hbd)) ? (wire0 ~^ reg29) : (^reg36)) : ({reg5,
                      reg12} <= (~&reg22)))));
            end
          reg40 <= ($signed({{(reg22 ? reg30 : reg9)},
              $unsigned(reg19)}) || $unsigned(($unsigned((|reg30)) <<< wire0)));
          if ((reg9[(2'h2):(2'h2)] ?
              ($unsigned((|(wire23 < (8'had)))) ?
                  (wire2[(3'h5):(2'h2)] ~^ $signed((wire0 ?
                      reg22 : reg32))) : reg10[(2'h2):(1'h1)]) : $unsigned($signed(reg21[(4'hf):(4'hd)]))))
            begin
              reg41 <= $signed((-reg35[(3'h5):(2'h2)]));
              reg42 <= {$signed((|((reg39 == wire0) << $unsigned(wire1))))};
              reg43 <= reg40;
              reg44 <= reg30[(4'h9):(2'h3)];
              reg45 <= (^wire24);
            end
          else
            begin
              reg41 <= $unsigned(($signed($unsigned((reg19 & (8'hb0)))) ?
                  reg21[(5'h12):(2'h3)] : (wire8[(2'h3):(2'h3)] < (7'h41))));
              reg42 <= {($unsigned($unsigned(reg27[(3'h4):(2'h3)])) ?
                      reg40 : (reg17 <<< reg38[(4'h9):(3'h7)])),
                  $signed($signed(((!wire23) < {reg20, wire26})))};
              reg43 <= (8'hb7);
              reg44 <= reg33;
              reg45 <= $signed($unsigned((&((reg44 + reg12) * (reg40 || (7'h42))))));
            end
        end
      else
        begin
          reg33 <= (+$signed(((^~$unsigned(reg21)) && ($unsigned((8'h9d)) ?
              {wire23} : ((8'hab) != wire8)))));
        end
      reg46 <= reg22[(1'h0):(1'h0)];
      reg47 <= (reg37[(3'h7):(3'h7)] ?
          (((+$unsigned(wire1)) ?
              {{wire24, reg40}, $unsigned(wire3)} : ($signed(reg12) ?
                  $signed(wire26) : $unsigned(reg19))) || (wire23[(2'h2):(2'h2)] ?
              (8'h9e) : (^reg19))) : (&reg43));
    end
  assign wire48 = (-$signed({((wire1 ? reg4 : reg44) ?
                          (reg44 | (8'ha8)) : (reg47 ? reg27 : reg21)),
                      ((+reg47) ? reg42[(2'h3):(1'h0)] : reg43)}));
endmodule
