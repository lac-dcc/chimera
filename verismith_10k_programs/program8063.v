module top
#(parameter param49 = ((^~{(((8'hb0) >> (8'ha1)) >>> ((8'ha2) ? (8'hb8) : (8'ha4)))}) ~^ {((|(~^(8'ha5))) ? ((+(8'hbe)) > {(8'h9c), (8'hae)}) : (!(&(8'hba)))), (8'ha0)}), 
parameter param50 = (8'hb8))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire25,
                 wire24,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg26,
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
                 (1'h0)};
  assign wire5 = (^$signed($signed(($signed(wire4) ?
                     (wire1 ? wire1 : wire1) : (~|wire1)))));
  assign wire6 = $unsigned(($signed($signed((wire1 + (8'ha8)))) ?
                     ($signed(wire0[(1'h0):(1'h0)]) & $unsigned((wire3 >>> (8'ha4)))) : wire1[(2'h3):(1'h0)]));
  assign wire7 = ($signed(((wire1 ?
                         $unsigned(wire3) : (wire1 ? wire0 : wire5)) << (wire3 ?
                         $signed(wire4) : {wire1, wire6}))) ?
                     (wire2 ?
                         ($unsigned((wire2 ?
                             wire2 : wire2)) ^~ wire4) : $signed((wire1 ?
                             $signed(wire5) : (wire6 ?
                                 (8'h9c) : wire4)))) : $signed(wire3[(2'h3):(1'h1)]));
  assign wire8 = wire3[(1'h1):(1'h1)];
  assign wire9 = (^~wire6);
  assign wire10 = $signed(wire5);
  assign wire11 = wire4[(4'h8):(3'h4)];
  assign wire12 = (!$signed(($signed($unsigned((8'hac))) && ((wire11 | wire1) - $unsigned(wire11)))));
  always
    @(posedge clk) begin
      reg13 <= (($unsigned(wire12) & ((wire7[(3'h7):(1'h1)] || $unsigned(wire5)) ?
          (8'ha1) : wire5)) + ($unsigned($signed($signed(wire4))) << (8'ha1)));
      if (({wire0[(3'h7):(3'h7)], {wire2}} >> wire5[(4'hd):(3'h5)]))
        begin
          reg14 <= wire8[(2'h2):(1'h0)];
          reg15 <= {$signed(wire8)};
        end
      else
        begin
          if ({({$unsigned((^~reg15))} ?
                  (~&(wire7 ? $signed((8'hb4)) : (~&wire4))) : wire12)})
            begin
              reg14 <= wire7[(1'h0):(1'h0)];
              reg15 <= $signed($signed((reg13[(1'h0):(1'h0)] | (~|wire1))));
            end
          else
            begin
              reg14 <= (^reg13);
              reg15 <= wire9[(4'hc):(4'hc)];
              reg16 <= $unsigned(($unsigned(wire10) < (!($unsigned(wire5) == reg13))));
              reg17 <= (8'hb2);
            end
          reg18 <= reg17[(1'h1):(1'h1)];
          reg19 <= (((((wire4 * (8'ha1)) > (8'hb6)) ?
              wire5[(4'h8):(3'h7)] : reg14) >> wire11[(2'h3):(2'h3)]) * wire3);
          reg20 <= ($signed(wire0[(4'ha):(4'h8)]) != wire6);
          reg21 <= reg17;
        end
      reg22 <= wire0;
      reg23 <= reg18;
    end
  assign wire24 = $unsigned(((reg16 ? (8'hb6) : wire6) >>> {(reg16 + wire10)}));
  assign wire25 = {($unsigned((|$signed(wire6))) ?
                          {(wire6[(3'h7):(3'h4)] ?
                                  $signed(wire10) : ((8'hb1) >= wire2))} : $unsigned(reg18[(1'h0):(1'h0)])),
                      (~|(((wire6 * wire1) > wire6[(3'h6):(3'h4)]) & ($signed(reg23) >>> (wire1 ?
                          reg15 : reg18))))};
  always
    @(posedge clk) begin
      if (reg20[(1'h0):(1'h0)])
        begin
          reg26 <= (({reg21[(4'hf):(1'h1)]} ?
                  (((wire7 ? wire4 : (8'hb5)) + (reg15 <<< reg23)) ?
                      $signed((wire2 | wire11)) : reg17) : $unsigned($signed($unsigned(reg14)))) ?
              (!(&$unsigned((wire12 ? (8'hb4) : wire8)))) : {reg22});
          reg27 <= ({($signed($signed(reg16)) ?
                  (reg20[(2'h2):(1'h0)] ?
                      $unsigned(wire0) : reg20[(3'h6):(3'h5)]) : wire2[(2'h2):(1'h1)]),
              (((reg20 ? wire9 : wire11) ?
                  $unsigned(wire12) : $signed(reg21)) < $unsigned((wire3 >= reg21)))} != (^$signed({reg15,
              (~&reg18)})));
          reg28 <= reg18;
        end
      else
        begin
          if ((7'h43))
            begin
              reg26 <= reg18[(2'h2):(1'h0)];
              reg27 <= {(($unsigned((wire9 && (8'hae))) - {wire0[(4'ha):(3'h7)]}) + reg13[(4'h8):(3'h6)])};
            end
          else
            begin
              reg26 <= reg15;
              reg27 <= wire5[(1'h0):(1'h0)];
            end
          reg28 <= ($unsigned(((!(8'hba)) | reg20)) ?
              ((~|(~^$signed(wire0))) - (($unsigned(wire11) ?
                  wire11 : $unsigned(reg26)) == ($unsigned(reg21) ?
                  wire3 : (&wire5)))) : wire24);
          if ($unsigned(reg22))
            begin
              reg29 <= wire6[(4'h8):(2'h2)];
              reg30 <= wire7;
              reg31 <= ({((~^$signed(reg27)) ? (8'hb0) : wire9[(1'h0):(1'h0)]),
                  reg29[(4'h8):(3'h6)]} >> $signed((reg14[(3'h4):(2'h2)] ?
                  ($signed(reg23) ?
                      $unsigned(wire0) : wire9[(4'hd):(4'ha)]) : $signed((7'h43)))));
              reg32 <= $unsigned({{$signed((reg18 ? reg17 : wire3)),
                      $unsigned({(8'hb3)})},
                  (~reg14)});
              reg33 <= reg15;
            end
          else
            begin
              reg29 <= $signed((|wire1));
              reg30 <= reg32;
              reg31 <= {wire7};
            end
          if ((~&wire6))
            begin
              reg34 <= $unsigned($signed((!$signed($unsigned((8'hac))))));
              reg35 <= wire1[(4'he):(4'h9)];
              reg36 <= $unsigned(reg15[(3'h4):(1'h1)]);
              reg37 <= $signed($signed(($signed(reg30) ?
                  reg32 : $signed((-(8'hbb))))));
              reg38 <= wire11;
            end
          else
            begin
              reg34 <= $signed((({(~^reg35), reg19} & $unsigned(((8'h9d) ?
                      reg20 : reg34))) ?
                  (reg13 != ((8'had) * $signed(wire25))) : reg17));
              reg35 <= wire0[(3'h4):(1'h0)];
            end
          if ((~^(($signed((~^(8'ha0))) ?
              reg28[(5'h12):(4'h9)] : $unsigned((reg18 >>> wire3))) >= (&wire5[(2'h3):(2'h3)]))))
            begin
              reg39 <= wire11;
              reg40 <= $unsigned(reg16[(4'hc):(3'h6)]);
              reg41 <= reg19[(4'h9):(3'h5)];
            end
          else
            begin
              reg39 <= (+(+{reg19[(4'h9):(4'h9)], (wire1 + $signed(reg21))}));
              reg40 <= $signed($unsigned(($signed((reg22 ? reg26 : wire11)) ?
                  $signed((wire10 >= reg13)) : (~|(^reg14)))));
              reg41 <= (reg31[(1'h0):(1'h0)] ^ $signed($signed((8'ha5))));
              reg42 <= {(^~$unsigned(({reg26,
                      wire1} ~^ reg13[(3'h5):(3'h5)])))};
              reg43 <= (^~reg41);
            end
        end
      reg44 <= reg38[(3'h5):(2'h2)];
      reg45 <= reg39;
    end
  assign wire46 = (^~$unsigned(reg28[(2'h2):(1'h1)]));
  assign wire47 = reg32[(1'h0):(1'h0)];
  assign wire48 = ({(-$signed((reg38 ?
                          wire46 : wire46)))} ~^ $unsigned($unsigned($signed((reg16 || reg14)))));
endmodule
