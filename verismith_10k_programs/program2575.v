module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire60;
  assign y = {wire62, wire4, wire5, wire6, wire60, (1'h0)};
  assign wire4 = $signed((((^$unsigned(wire0)) ?
                     (wire1[(2'h2):(1'h0)] ?
                         wire1[(2'h3):(1'h0)] : (wire3 ?
                             wire0 : wire0)) : ($unsigned(wire3) < wire1)) >>> ($unsigned((wire1 | (8'haf))) ?
                     (-wire0[(4'ha):(2'h2)]) : $signed((!wire0)))));
  assign wire5 = wire2[(2'h3):(2'h2)];
  assign wire6 = wire0[(5'h10):(1'h0)];
  module7 #() modinst61 (.wire8(wire5), .wire11(wire6), .wire10(wire3), .clk(clk), .y(wire60), .wire9(wire4), .wire12(wire1));
  assign wire62 = wire6[(3'h5):(3'h4)];
endmodule

module module7
#(parameter param58 = (|{((((7'h42) > (8'ha6)) || ((8'hba) >> (8'hb2))) >> (^~(!(8'hb6)))), ((^(-(8'hbe))) - ((+(7'h43)) + ((8'ha6) ^~ (8'ha2))))}), 
parameter param59 = param58)
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire13;
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  assign y = {wire57,
                 wire55,
                 wire21,
                 wire13,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire13 = (((~|(-$signed(wire11))) << {$unsigned(wire12[(2'h2):(1'h1)])}) ?
                      $signed(($unsigned(((8'hb3) || wire9)) ?
                          (8'h9c) : (wire8 ?
                              (wire11 ?
                                  wire8 : wire11) : $signed((7'h43))))) : $unsigned((wire10 ?
                          $signed((8'hae)) : (^wire8[(4'h9):(4'h9)]))));
  always
    @(posedge clk) begin
      if ($signed(($unsigned(wire8[(5'h11):(4'hd)]) && (($unsigned(wire13) ?
          (^~(8'hbf)) : wire9[(4'hb):(4'ha)]) && $unsigned(wire10)))))
        begin
          reg14 <= (~^wire9);
          reg15 <= (-$signed(({(~&wire12),
              (reg14 ? wire9 : wire9)} + $unsigned({wire12, reg14}))));
          reg16 <= $signed((+$unsigned((wire13 >> $unsigned((8'hbe))))));
        end
      else
        begin
          reg14 <= {$unsigned((($unsigned(wire8) ^~ wire10[(3'h4):(1'h0)]) ?
                  $signed($signed(wire13)) : (!(wire8 ? reg15 : wire10))))};
          if ($unsigned((((reg15 >> (wire8 ? wire13 : reg14)) & (&(reg14 ?
                  wire13 : reg15))) ?
              (~^(((8'hb8) | (7'h42)) >>> (wire10 ^ reg16))) : wire9[(4'hd):(2'h3)])))
            begin
              reg15 <= (wire12[(1'h0):(1'h0)] ^ reg14[(3'h5):(3'h4)]);
              reg16 <= ((&(wire11 ^~ ((reg14 ? wire11 : wire12) ?
                  {wire9,
                      reg15} : $signed(wire12)))) & (((~|reg16) >= (+(wire8 ^~ reg14))) | (-({wire13} ?
                  (~(8'h9f)) : $signed(wire10)))));
              reg17 <= $unsigned(($unsigned(({wire13, (8'hbe)} ?
                  wire8 : (&(8'hb9)))) & ({$signed(wire10)} ?
                  $signed(reg15) : (^~(|(7'h44))))));
            end
          else
            begin
              reg15 <= (reg15[(1'h1):(1'h1)] != (((wire12 > $signed(reg15)) ?
                  {(8'hb1), (~wire13)} : ($unsigned(wire10) ?
                      reg17 : (wire11 ? (8'haa) : wire8))) <= (~&wire8)));
              reg16 <= ($signed(($signed(reg17[(2'h3):(1'h1)]) ?
                      ($signed(reg14) - reg14) : ((wire9 ? wire9 : (8'hbb)) ?
                          (reg15 ^ reg16) : $unsigned(reg17)))) ?
                  reg16 : reg14[(3'h6):(1'h1)]);
              reg17 <= reg14[(3'h7):(1'h0)];
              reg18 <= ((8'hac) ?
                  $signed($unsigned(reg14[(3'h7):(1'h0)])) : {reg15[(2'h2):(2'h2)],
                      (~|$signed($unsigned(wire10)))});
            end
          reg19 <= wire11;
        end
      reg20 <= $signed(wire13[(1'h1):(1'h0)]);
    end
  assign wire21 = ($signed((~$signed(reg18[(4'h8):(1'h0)]))) - ((8'hb9) > $unsigned(((~|reg17) <= (reg20 ?
                      (7'h40) : wire13)))));
  module22 #() modinst56 (wire55, clk, reg18, wire12, wire13, reg20);
  assign wire57 = (reg17 >> wire10);
endmodule

module module22
#(parameter param53 = ((({(~|(8'hb1))} & (-(~(8'hac)))) == ((((8'hba) ? (8'ha3) : (8'haf)) > {(8'hb1), (8'hb6)}) <<< (8'ha1))) ? (+{(~^(~|(8'hb0)))}) : ({(((8'hbc) <<< (8'hbd)) ? ((8'hb8) && (8'hb3)) : (^(8'ha7)))} != {(-((8'ha2) ^~ (8'ha9)))})), 
parameter param54 = (param53 ? param53 : (((param53 - param53) ? param53 : (param53 ? (param53 | param53) : (param53 && param53))) && (&param53))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire28,
                 wire27,
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
                 (1'h0)};
  assign wire27 = (|$unsigned((8'ha2)));
  assign wire28 = $signed(({wire25,
                      {(wire26 ? (8'ha3) : wire23),
                          (wire27 - wire23)}} ~^ (wire25 ?
                      $signed((wire23 & wire23)) : (&{wire24}))));
  always
    @(posedge clk) begin
      reg29 <= ((wire23[(5'h12):(5'h12)] ?
          ((~|(wire25 >= wire24)) > (wire26 == (8'ha4))) : $unsigned($unsigned((+wire24)))) >= ((^~wire25[(5'h11):(3'h5)]) ?
          $signed($signed((~|wire24))) : wire25));
      if ({(~&(!reg29))})
        begin
          reg30 <= ($unsigned($signed($signed($signed(wire23)))) ?
              ((wire24[(3'h4):(1'h0)] ?
                  wire23[(5'h12):(4'he)] : {wire26}) ^ ($unsigned(wire26[(5'h13):(3'h5)]) == $unsigned((~|reg29)))) : (!wire27[(1'h1):(1'h0)]));
        end
      else
        begin
          reg30 <= (-(wire25 ?
              ({wire23[(5'h10):(2'h2)]} >> wire23) : (~&(|$unsigned(wire25)))));
          reg31 <= (~&(&$unsigned((&(wire27 ? wire24 : wire26)))));
          reg32 <= wire25;
          if ($unsigned(((7'h40) ?
              {$signed(((7'h43) ?
                      (7'h43) : reg32))} : ($signed(((8'hbe) != wire26)) > $unsigned((!reg30))))))
            begin
              reg33 <= $signed(reg29);
              reg34 <= (&(({$unsigned((8'ha6))} ?
                      (~&$signed(wire28)) : wire24[(3'h6):(1'h0)]) ?
                  (-(8'hba)) : wire28[(3'h7):(1'h0)]));
              reg35 <= {wire26[(4'hc):(2'h3)], (!(+wire26))};
              reg36 <= (~|wire28);
            end
          else
            begin
              reg33 <= reg31;
              reg34 <= wire28;
              reg35 <= reg32;
              reg36 <= $unsigned({($signed((^~wire27)) ?
                      ({reg29} ? (~^reg29) : reg31) : $signed($signed(reg33))),
                  (reg30[(5'h10):(4'h9)] ? ((~|reg36) || (~reg29)) : wire25)});
              reg37 <= (wire25 == reg29[(5'h12):(4'hb)]);
            end
        end
      if (reg35)
        begin
          reg38 <= $signed(wire24);
          reg39 <= wire26;
          reg40 <= $signed(wire27[(1'h0):(1'h0)]);
        end
      else
        begin
          reg38 <= (~^$signed($unsigned((~reg35[(1'h0):(1'h0)]))));
        end
    end
  always
    @(posedge clk) begin
      reg41 <= (wire26 >>> wire26[(3'h5):(2'h2)]);
      if ($signed(reg31))
        begin
          reg42 <= (-wire25);
        end
      else
        begin
          reg42 <= $unsigned((~&(((reg32 ~^ reg39) >>> $signed(wire26)) ?
              wire24[(2'h2):(1'h1)] : {(|reg35), (^wire27)})));
          reg43 <= (-((reg42[(4'hb):(3'h5)] == reg35[(3'h5):(2'h2)]) >> {reg37[(2'h3):(2'h3)],
              (~^(~(8'h9d)))}));
          reg44 <= reg43[(2'h2):(1'h1)];
        end
      reg45 <= (7'h44);
    end
  assign wire46 = (wire28 * wire27);
  assign wire47 = {(&$unsigned(reg33)), (~|reg29[(1'h1):(1'h0)])};
  assign wire48 = (&$unsigned(reg41[(3'h6):(1'h0)]));
  assign wire49 = $unsigned($signed((~&($unsigned(reg35) ?
                      (reg29 <= (8'ha3)) : wire46))));
  assign wire50 = $signed($unsigned(((~&$signed(reg31)) >>> $unsigned((~&wire23)))));
  assign wire51 = (8'had);
  assign wire52 = $signed(wire27[(1'h0):(1'h0)]);
endmodule
