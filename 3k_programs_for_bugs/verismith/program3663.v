module top
#(parameter param45 = (^(~|(^{((8'ha9) > (8'hb6)), ((8'hab) ? (8'ha9) : (7'h44))}))), 
parameter param46 = ((8'h9d) && param45))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  assign y = {wire44,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ((($signed((wire0 < wire1)) + wire2) ?
                         $signed(({(8'hbc),
                             wire1} & $signed(wire1))) : wire0[(3'h5):(3'h4)]) ?
                     {wire0,
                         ($unsigned(wire3[(3'h4):(3'h4)]) ?
                             wire0[(2'h3):(2'h3)] : (wire1 ?
                                 (^~wire4) : ((8'ha6) + wire2)))} : $unsigned((wire3[(3'h5):(3'h4)] >= $signed($signed(wire3)))));
  assign wire6 = ($unsigned((($signed(wire4) ? (8'haf) : (wire3 >> wire2)) ?
                     $unsigned((&wire0)) : $signed($unsigned(wire4)))) & $signed(((~|(~&wire0)) < $unsigned(wire2[(2'h2):(1'h1)]))));
  assign wire7 = wire5;
  assign wire8 = (($signed(({wire6, (8'ha6)} ?
                     wire5[(3'h4):(1'h1)] : (wire1 ?
                         (8'h9f) : wire7))) < ((+{wire5}) ?
                     (&wire2[(1'h0):(1'h0)]) : ((wire2 ? wire1 : wire2) ?
                         wire4[(3'h5):(1'h1)] : ((7'h44) > wire3)))) * (wire4 ?
                     $signed($unsigned($signed(wire5))) : wire5));
  assign wire9 = $signed((8'hb4));
  always
    @(posedge clk) begin
      if (($unsigned(((((8'hbb) ? wire9 : (8'hb9)) ?
              (|wire5) : $unsigned(wire8)) ?
          $signed(wire9) : wire6)) * wire4[(5'h13):(2'h2)]))
        begin
          if (((-$signed(wire1)) ?
              $unsigned($unsigned($unsigned($signed(wire8)))) : $signed($unsigned((wire6 ?
                  wire9 : (wire1 ^ wire4))))))
            begin
              reg10 <= {$signed((wire1 * wire4))};
              reg11 <= (!($signed(({wire6,
                  wire4} > (wire2 & reg10))) ^ $unsigned(($unsigned(wire0) >>> (|reg10)))));
              reg12 <= $unsigned(reg10[(1'h0):(1'h0)]);
              reg13 <= wire9[(3'h4):(2'h3)];
            end
          else
            begin
              reg10 <= $signed(($signed((&$signed(wire6))) ?
                  $unsigned(reg12[(4'hb):(3'h5)]) : $signed((reg12[(3'h7):(3'h5)] ?
                      (wire8 ~^ (8'had)) : wire5))));
              reg11 <= (~&$unsigned($unsigned((!$signed(reg11)))));
              reg12 <= $signed(((!$signed((wire0 ? wire7 : (8'ha1)))) ?
                  wire9[(1'h0):(1'h0)] : (8'h9f)));
            end
          reg14 <= (~&(wire1 ?
              (($signed(wire9) ?
                  wire6[(5'h10):(4'hf)] : (wire1 ?
                      wire7 : wire6)) ~^ reg10) : wire0));
          reg15 <= $unsigned(wire9[(1'h0):(1'h0)]);
          reg16 <= (~wire4[(5'h10):(4'hf)]);
          reg17 <= {(((8'hbf) ?
                  $unsigned(reg14[(3'h4):(2'h2)]) : ($signed(wire3) ?
                      {reg13} : (~&reg11))) - (7'h44)),
              $unsigned($unsigned(((reg12 ? wire7 : reg15) <<< {(8'hb3)})))};
        end
      else
        begin
          reg10 <= (!(reg14 << $signed(({reg12} || (~&reg15)))));
        end
      if ((!reg12[(2'h2):(1'h0)]))
        begin
          if ((((8'haa) ? wire8[(4'h9):(1'h1)] : reg10[(1'h0):(1'h0)]) ?
              wire3[(3'h4):(1'h1)] : $signed(wire2[(1'h1):(1'h1)])))
            begin
              reg18 <= reg16[(4'hc):(1'h0)];
            end
          else
            begin
              reg18 <= ($signed((($signed(wire6) << $unsigned(reg13)) <= wire2)) ?
                  ($unsigned(reg13[(3'h7):(3'h7)]) ?
                      (((wire4 ? (8'haa) : reg10) ?
                              {(8'haa)} : reg11[(3'h6):(3'h4)]) ?
                          (|wire8) : ($signed((8'ha7)) ?
                              $signed(reg11) : ((8'hbc) ?
                                  wire4 : wire6))) : (!reg14[(2'h3):(2'h3)])) : ({$unsigned((&(8'hbd)))} ?
                      ($signed($unsigned((8'hb8))) + wire5) : (wire3[(4'h9):(3'h5)] ?
                          ((reg11 ?
                              (8'hb3) : (8'hb9)) && (+reg18)) : wire4[(4'hc):(2'h3)])));
              reg19 <= ((((-wire7[(3'h7):(3'h7)]) ?
                  reg12[(4'h8):(2'h2)] : $unsigned((reg11 ?
                      (7'h40) : reg15))) >> reg15[(2'h3):(2'h2)]) <<< wire2[(1'h1):(1'h0)]);
            end
          reg20 <= ({$unsigned($signed(reg12[(1'h0):(1'h0)]))} ?
              $signed($signed((&(wire2 << reg13)))) : wire1);
          if ($unsigned(reg15))
            begin
              reg21 <= (({((+reg13) << (~&(7'h44))),
                      (^(^(8'hac)))} * wire9[(3'h4):(1'h1)]) ?
                  {(~^$unsigned((|wire6)))} : $signed($unsigned($signed((reg17 ?
                      reg14 : wire2)))));
              reg22 <= $signed({$signed($unsigned((reg12 <= (7'h42)))),
                  $unsigned($unsigned($unsigned(reg13)))});
              reg23 <= reg11;
              reg24 <= ({(!(-$signed(reg15))),
                      $unsigned((-reg21[(3'h4):(2'h3)]))} ?
                  $unsigned({($unsigned(reg14) ?
                          reg14[(3'h4):(2'h3)] : (reg16 ?
                              reg10 : (8'hb5)))}) : (reg17 ?
                      {(8'ha6), (~^(!(8'hb9)))} : wire8));
            end
          else
            begin
              reg21 <= reg17[(1'h1):(1'h0)];
              reg22 <= ((($signed((reg12 ? wire6 : wire0)) ?
                  reg11[(4'h9):(4'h9)] : {$signed((8'ha3))}) && {$unsigned({wire2})}) ~^ (reg23 ?
                  ((reg19[(2'h3):(2'h3)] || {reg22}) - $unsigned((reg20 ?
                      wire0 : wire4))) : reg19[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg18 <= $unsigned(((-wire7) ?
              (~&((8'ha6) ? $unsigned(wire9) : (^~reg14))) : $unsigned(((wire1 ?
                  reg22 : reg14) || $signed(reg15)))));
        end
    end
  assign wire25 = reg11[(4'h8):(3'h6)];
  assign wire26 = wire7;
  assign wire27 = ({(((reg13 ? wire1 : (8'ha5)) ? $unsigned(reg12) : reg14) ?
                          wire1[(3'h6):(3'h6)] : wire5[(4'h9):(3'h7)]),
                      $unsigned($signed($unsigned(wire0)))} + ($unsigned(reg14) <<< ($signed(reg12) ?
                      (^reg13) : (reg14[(1'h1):(1'h0)] ?
                          (~reg24) : (wire1 ? reg17 : reg12)))));
  assign wire28 = {($signed(($unsigned(reg14) ^~ ((8'ha6) | reg23))) + wire26)};
  always
    @(posedge clk) begin
      reg29 <= (~(((-$signed(reg23)) > reg18) ^~ wire2));
      if (($unsigned((($unsigned(wire8) ?
          {reg11} : reg19[(2'h3):(2'h3)]) >= $unsigned($signed(wire26)))) >>> reg10))
        begin
          reg30 <= reg24;
        end
      else
        begin
          reg30 <= $signed(wire26[(4'hb):(4'h9)]);
        end
      reg31 <= (-wire28[(4'h8):(3'h6)]);
      if ((~|wire4))
        begin
          if (reg10[(2'h2):(1'h0)])
            begin
              reg32 <= reg23;
              reg33 <= wire27[(1'h1):(1'h0)];
              reg34 <= wire25[(3'h6):(2'h3)];
              reg35 <= $unsigned({$signed($signed(reg22))});
              reg36 <= {((+$signed(reg21[(1'h0):(1'h0)])) >> ((8'hb3) << $signed((reg30 * reg34))))};
            end
          else
            begin
              reg32 <= (7'h42);
              reg33 <= $unsigned({$signed(reg19), reg34[(3'h7):(1'h1)]});
            end
          if (wire6)
            begin
              reg37 <= (reg35 ?
                  (8'ha2) : ($unsigned(reg12[(2'h3):(1'h0)]) ?
                      $signed((reg19[(1'h1):(1'h0)] + reg13[(2'h2):(2'h2)])) : wire28));
              reg38 <= ((|reg15) ?
                  ((8'ha0) != ($signed($signed(wire8)) ?
                      $signed(reg24) : (|((7'h40) ?
                          wire25 : wire25)))) : {$unsigned($signed(reg21))});
            end
          else
            begin
              reg37 <= (~^($unsigned($unsigned(((8'hbb) * reg10))) ?
                  (8'hbc) : (({reg32} ?
                          $signed(reg12) : (reg23 ? reg12 : reg14)) ?
                      (~|(!wire6)) : (wire1 ^ {wire1}))));
              reg38 <= (~^reg18);
              reg39 <= reg12;
              reg40 <= $signed(reg30);
            end
          reg41 <= wire4;
          reg42 <= reg34;
        end
      else
        begin
          reg32 <= ($unsigned(reg29[(4'hd):(1'h0)]) | (8'ha6));
          reg33 <= ($unsigned((8'ha5)) - $unsigned($signed((reg32 ~^ reg32))));
          reg34 <= (~$unsigned($unsigned((^((8'hb8) & (8'hb8))))));
          reg35 <= reg35[(1'h0):(1'h0)];
          reg36 <= $unsigned($signed($signed($unsigned((8'hb9)))));
        end
    end
  always
    @(posedge clk) begin
      reg43 <= reg14;
    end
  assign wire44 = $signed($signed((&$signed((~wire9)))));
endmodule
