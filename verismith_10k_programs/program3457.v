module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire7;
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire33,
                 wire7,
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
                 reg4,
                 reg5,
                 reg6,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed((($signed(((8'hba) * wire3)) ?
          $signed($signed(wire3)) : $signed((wire1 ^ wire0))) | wire1[(4'hc):(4'hb)]));
      reg5 <= {(wire1[(4'he):(3'h7)] ?
              reg4 : ($signed($unsigned(wire3)) | (8'h9c)))};
      reg6 <= wire2[(4'h8):(1'h1)];
    end
  assign wire7 = (((reg6 ?
                         reg4 : wire3[(1'h1):(1'h1)]) >> $unsigned(reg6[(1'h0):(1'h0)])) ?
                     $signed($unsigned((+$unsigned(reg4)))) : wire1[(2'h2):(1'h1)]);
  module8 #() modinst34 (.wire9(wire1), .wire10(reg4), .clk(clk), .wire13(wire0), .y(wire33), .wire11(wire3), .wire12(wire7));
  always
    @(posedge clk) begin
      reg35 <= ($unsigned($signed((reg5 ?
          reg5[(3'h5):(1'h0)] : (+(7'h43))))) >> $signed($signed(((wire33 != reg5) ~^ $signed(wire1)))));
    end
  always
    @(posedge clk) begin
      reg36 <= {(~&$signed(wire7[(3'h7):(2'h3)])),
          $signed(($unsigned((wire3 ? reg4 : (8'hac))) ?
              ((+wire2) && ((8'hb2) || wire2)) : {(wire3 ^ reg4)}))};
      if ($signed(wire0[(2'h3):(1'h1)]))
        begin
          reg37 <= {reg36[(3'h4):(1'h1)], wire0[(3'h4):(3'h4)]};
          reg38 <= wire33[(1'h0):(1'h0)];
        end
      else
        begin
          if (reg38)
            begin
              reg37 <= wire33;
              reg38 <= (reg5 | reg38);
            end
          else
            begin
              reg37 <= $unsigned($unsigned($signed(((reg5 ? (8'hb4) : reg36) ?
                  (-reg5) : reg5))));
              reg38 <= reg36[(3'h4):(1'h0)];
              reg39 <= ({(~^wire3)} ?
                  wire0[(3'h7):(3'h7)] : reg35[(4'h9):(4'h9)]);
              reg40 <= reg5;
              reg41 <= ((($unsigned($unsigned(wire33)) * reg40) ?
                  reg4 : {{reg40[(2'h3):(1'h1)],
                          $unsigned(wire33)}}) | (8'hb6));
            end
          reg42 <= ({$signed((~|reg37)), reg4} && {reg39[(2'h2):(1'h1)],
              $signed(((wire3 >>> reg4) <<< ((8'ha0) ? reg36 : reg4)))});
          reg43 <= (wire7[(3'h5):(2'h2)] ^~ (({reg35} ?
              (reg40[(3'h4):(2'h2)] ?
                  $unsigned(reg4) : reg6[(3'h5):(1'h1)]) : wire2[(3'h4):(1'h0)]) < ($signed(reg5) ?
              (!$unsigned(reg41)) : ((8'hb3) == $signed(reg6)))));
          reg44 <= wire7;
          reg45 <= reg37[(3'h4):(2'h2)];
        end
    end
  assign wire46 = (!$signed($unsigned({(wire1 ^ (8'ha9)), (~&wire2)})));
  assign wire47 = $unsigned((({$signed((8'ha9))} <= {{(8'hbe), wire1},
                          (reg45 ? reg37 : reg40)}) ?
                      $signed(((!wire2) > (wire0 ?
                          reg6 : reg45))) : (+((~|reg43) ?
                          $unsigned(wire0) : $unsigned(reg36)))));
  assign wire48 = $unsigned((8'hb5));
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  assign y = {wire32,
                 wire15,
                 wire14,
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
                 (1'h0)};
  assign wire14 = (wire10[(2'h2):(1'h1)] || wire11[(3'h4):(2'h2)]);
  assign wire15 = $signed(wire12[(4'h9):(2'h2)]);
  always
    @(posedge clk) begin
      reg16 <= $signed(wire11[(1'h1):(1'h0)]);
      if (($signed($unsigned(({(8'hb9), reg16} ?
              $unsigned(wire15) : (wire9 ? wire11 : wire10)))) ?
          (wire9[(2'h2):(1'h0)] <= ($unsigned(wire9[(2'h3):(2'h2)]) > $signed((+reg16)))) : (~$unsigned((7'h40)))))
        begin
          reg17 <= (~|wire9[(3'h5):(2'h3)]);
          if ({$signed($signed(wire14))})
            begin
              reg18 <= ((((wire11[(1'h0):(1'h0)] ?
                              $unsigned(reg17) : (-wire11)) ?
                          wire11[(2'h3):(1'h1)] : ((wire13 ^~ (8'hbf)) > $signed(wire11))) ?
                      ($signed({wire14}) ?
                          (~$unsigned(wire15)) : {wire12[(4'hc):(3'h4)]}) : (|$signed($signed(wire13)))) ?
                  reg16 : ((((8'hb1) ? $signed(reg17) : $signed((8'hb5))) ?
                      reg16[(3'h5):(1'h1)] : $unsigned((|wire11))) * $signed(wire13)));
              reg19 <= {$unsigned((!((8'ha1) == $signed(wire12)))),
                  wire15[(4'h8):(3'h4)]};
              reg20 <= $unsigned((^$signed($signed(wire9))));
              reg21 <= $unsigned((~^{wire13[(1'h0):(1'h0)],
                  ({wire14} ? (reg16 ? reg20 : wire14) : (~&wire13))}));
              reg22 <= $unsigned($signed(reg16[(2'h3):(2'h2)]));
            end
          else
            begin
              reg18 <= wire10;
              reg19 <= $signed(((((wire13 ? wire15 : (8'hb7)) ?
                      (8'ha1) : {reg20, reg22}) == {$unsigned(wire14), reg17}) ?
                  ($signed({(8'had), wire11}) ?
                      wire13 : wire15[(4'h8):(3'h4)]) : wire11));
            end
        end
      else
        begin
          reg17 <= ($signed(reg16[(3'h4):(1'h1)]) ?
              (!{(^$signed(reg22)),
                  {{(8'ha6), reg22}, wire14[(2'h3):(1'h1)]}}) : reg19);
          reg18 <= reg19[(2'h3):(2'h3)];
          reg19 <= $signed($signed($signed((|((8'hb0) <<< wire10)))));
          reg20 <= wire15;
          reg21 <= $signed($unsigned(reg22[(3'h6):(3'h5)]));
        end
      reg23 <= wire12[(2'h2):(1'h0)];
      reg24 <= ((~|((8'ha5) ? $unsigned(reg23) : $unsigned($unsigned(reg19)))) ?
          {$unsigned(wire9[(1'h1):(1'h1)]), ((|wire11) ^~ reg18)} : ((~^(reg23 ?
                  $signed(reg16) : (~^reg18))) ?
              ($unsigned($signed(reg23)) ?
                  (reg22 >= (|wire13)) : (8'hb4)) : ($signed($signed((8'ha5))) ?
                  wire11 : ((8'ha9) ?
                      (reg17 ? (8'ha3) : (7'h42)) : (reg20 ?
                          wire11 : wire14)))));
      if ($unsigned($unsigned(reg20[(4'ha):(2'h2)])))
        begin
          reg25 <= $unsigned($unsigned({(reg18[(5'h15):(4'h8)] ?
                  $signed(reg23) : $unsigned(wire15))}));
          if (($unsigned(reg18[(3'h5):(3'h5)]) + {(wire10[(1'h0):(1'h0)] ^~ (!wire12)),
              (8'h9f)}))
            begin
              reg26 <= reg21[(3'h7):(1'h1)];
            end
          else
            begin
              reg26 <= {reg22,
                  $unsigned((~^$unsigned((wire12 ? wire14 : reg18))))};
              reg27 <= $signed({wire11[(2'h2):(1'h1)]});
              reg28 <= $unsigned(reg23);
            end
          reg29 <= (($signed(wire12) | (-reg20)) ?
              ($signed((~|$unsigned(wire14))) + $unsigned(((wire12 == reg27) <= {wire13,
                  reg27}))) : (!$unsigned(wire10)));
          reg30 <= (((reg24 ?
                  (reg19[(4'h9):(1'h0)] ?
                      (wire10 + reg28) : {(8'hbb)}) : wire10[(1'h1):(1'h0)]) ?
              reg28[(1'h1):(1'h0)] : (((reg24 + reg20) << ((8'hb7) ?
                  wire14 : reg17)) == ($unsigned(reg27) >= wire15))) <= ((((~&reg21) & reg18) ?
                  reg28 : reg19) ?
              wire12[(5'h12):(4'ha)] : (-{$unsigned(wire12)})));
          reg31 <= reg20[(4'h8):(1'h1)];
        end
      else
        begin
          reg25 <= reg29;
        end
    end
  assign wire32 = (({reg24, {$unsigned((8'ha2))}} < (8'ha3)) ?
                      (~^reg28[(2'h2):(1'h1)]) : {wire9});
endmodule
