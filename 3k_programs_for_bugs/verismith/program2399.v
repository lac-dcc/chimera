module top
#(parameter param71 = (+(~(~^(8'hb2)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire67;
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire8,
                 wire9,
                 wire10,
                 wire67,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (+(((-$unsigned(wire1)) < wire1) ?
          $unsigned(wire3) : (wire1 <<< wire1)));
      reg6 <= $unsigned($signed((~^(~^$unsigned(wire0)))));
      reg7 <= $unsigned(wire2);
    end
  assign wire8 = $unsigned((((wire4[(4'hd):(1'h0)] ? $signed(wire2) : wire4) ?
                     $signed($signed(reg6)) : $signed($signed(wire2))) == reg7));
  assign wire9 = wire0;
  assign wire10 = (((((~^wire0) << wire0) << (!((8'hb5) <<< reg7))) ^~ ({(wire9 ?
                              wire1 : wire0),
                          (wire8 == wire3)} ?
                      (^(wire8 ?
                          wire0 : reg6)) : (&(+reg6)))) != ({$signed($unsigned((8'hab)))} || wire1));
  module11 #() modinst68 (wire67, clk, wire3, reg7, wire10, reg5, wire2);
  assign wire69 = wire9;
  assign wire70 = wire69;
endmodule

module module11
#(parameter param65 = (((&(((8'hb9) ^~ (8'haf)) ^~ ((8'hba) & (8'haf)))) > ((((8'hb5) <<< (8'hb9)) + (+(8'ha0))) ? ({(8'h9c)} ? (^(8'hac)) : (~(8'hbd))) : (~&{(8'hbd), (8'hbd)}))) < (8'h9f)), 
parameter param66 = {(^~param65)})
(y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire56;
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire17,
                 wire56,
                 (1'h0)};
  assign wire17 = ($signed((-{$unsigned((8'ha4))})) >= (~^wire15[(3'h6):(2'h2)]));
  module18 #() modinst57 (wire56, clk, wire16, wire14, wire15, wire13, wire12);
  assign wire58 = ($unsigned($signed($signed(((8'h9c) ?
                      wire12 : wire12)))) < $unsigned($signed($unsigned((wire15 ?
                      wire16 : wire12)))));
  assign wire59 = $signed(((~wire15) ~^ wire14[(4'hb):(3'h4)]));
  assign wire60 = (~|wire12[(5'h10):(3'h5)]);
  assign wire61 = (|(wire17[(4'hb):(3'h4)] ?
                      $signed(($unsigned((8'hb0)) <<< $signed(wire16))) : {$signed(wire60[(1'h0):(1'h0)])}));
  assign wire62 = wire16;
  assign wire63 = ($signed(wire16[(3'h4):(1'h0)]) ^ $unsigned((~&$unsigned($signed(wire56)))));
  assign wire64 = wire63;
endmodule

module module18
#(parameter param55 = (((~{((8'hb1) ? (7'h41) : (8'ha4))}) & ((((8'hbf) - (8'hb9)) >> ((8'hba) ? (7'h42) : (7'h41))) ? {((8'h9c) || (8'hab))} : (((8'hab) ^ (8'hbd)) ? ((7'h43) ? (8'ha9) : (8'ha5)) : ((7'h40) ? (8'hb4) : (7'h42))))) & (((+((8'hbb) ^~ (8'ha7))) * (~((7'h40) + (8'h9d)))) & (|(+((8'ha2) ? (8'ha8) : (8'ha4)))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire24;
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
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
                 reg25,
                 (1'h0)};
  assign wire24 = wire19;
  always
    @(posedge clk) begin
      reg25 <= ($signed($unsigned(wire21)) ?
          ((wire19 <= {(wire23 & (8'h9d))}) < (|((^~wire19) >> $signed(wire20)))) : {wire21[(3'h5):(1'h1)]});
    end
  assign wire26 = (~wire23);
  assign wire27 = wire22[(1'h0):(1'h0)];
  assign wire28 = wire23;
  assign wire29 = $signed(wire20);
  assign wire30 = wire19[(4'hb):(4'h8)];
  assign wire31 = wire28[(5'h12):(4'hf)];
  always
    @(posedge clk) begin
      if ($unsigned((($unsigned((^wire22)) >> wire21) <<< $signed(wire23))))
        begin
          reg32 <= $unsigned(((&wire30) ? wire27[(3'h6):(2'h2)] : wire27));
          reg33 <= $unsigned((wire24[(2'h2):(2'h2)] ?
              wire23[(1'h1):(1'h1)] : $signed((!reg25))));
          if (wire29)
            begin
              reg34 <= {(~^(wire27[(4'h8):(3'h5)] << ($unsigned(wire26) ?
                      (~&wire23) : reg25))),
                  $signed(((~&((8'ha8) - wire26)) ?
                      $signed(wire22[(3'h4):(1'h0)]) : $signed(reg25)))};
              reg35 <= $unsigned((((wire28 ? reg33 : (!wire22)) ?
                      ((wire27 ?
                          wire21 : reg34) ^~ (reg32 >= (8'h9e))) : wire19[(2'h2):(1'h1)]) ?
                  ({wire20[(4'hd):(3'h4)]} >>> $unsigned((reg34 ^~ reg25))) : $unsigned((^~(^~wire21)))));
              reg36 <= wire19;
              reg37 <= $unsigned(({$signed($signed(wire31))} ?
                  wire30 : $signed(reg25)));
            end
          else
            begin
              reg34 <= (7'h41);
            end
        end
      else
        begin
          reg32 <= wire23[(3'h5):(2'h3)];
          reg33 <= $unsigned(wire23[(2'h3):(2'h2)]);
          reg34 <= $signed(wire22[(2'h3):(1'h0)]);
          if ($signed((~&{wire23[(1'h1):(1'h1)]})))
            begin
              reg35 <= wire22;
              reg36 <= {((~|wire20) ?
                      (+(reg25 < reg36)) : (-$signed(reg37[(4'h8):(1'h0)])))};
              reg37 <= wire24[(3'h5):(3'h4)];
              reg38 <= (~&($signed(((~^wire24) <= (^~reg25))) ?
                  wire30[(4'h8):(3'h4)] : $unsigned((^~$signed(reg35)))));
            end
          else
            begin
              reg35 <= ($signed(($signed($unsigned(reg32)) ?
                  (^reg25) : $signed($unsigned(reg38)))) < (wire31 <= $signed((~^$signed(wire23)))));
              reg36 <= (wire29[(2'h3):(2'h2)] == wire30);
              reg37 <= (8'hb7);
              reg38 <= wire24;
              reg39 <= {($signed($signed(((8'ha8) ~^ reg25))) ?
                      $signed($signed($signed(wire27))) : reg35),
                  (reg25[(1'h1):(1'h0)] ?
                      wire30[(2'h2):(2'h2)] : (wire23[(2'h3):(2'h3)] ?
                          $unsigned($signed(wire26)) : wire22[(5'h11):(2'h3)]))};
            end
        end
      reg40 <= $signed($signed((|((reg38 ? reg36 : (8'h9c)) || (wire20 ?
          reg38 : reg33)))));
      if ((&(~&((~((8'hb3) >>> reg37)) * (wire20[(3'h5):(3'h4)] != (reg32 ?
          wire21 : (8'ha0)))))))
        begin
          if ({(wire28[(4'he):(4'hc)] ?
                  $signed((!(reg40 <= (8'hb4)))) : {wire20[(1'h1):(1'h0)]})})
            begin
              reg41 <= reg36[(4'h8):(2'h3)];
              reg42 <= (~&((((8'haf) < (wire23 >> reg40)) ?
                      ((reg32 <= (8'hb8)) ?
                          (~wire27) : {wire30}) : {reg36[(4'hd):(3'h7)],
                          $signed((8'hbf))}) ?
                  $signed($signed(wire22)) : ($signed($signed(wire19)) ?
                      ((reg32 ? reg34 : reg33) << (~&(8'ha8))) : wire28)));
              reg43 <= (reg35 == $signed($unsigned((8'ha0))));
            end
          else
            begin
              reg41 <= reg32[(3'h5):(1'h1)];
              reg42 <= (-((+{wire29, reg43}) ? reg38[(3'h4):(2'h2)] : wire21));
            end
        end
      else
        begin
          if ({$signed(($unsigned($unsigned(reg43)) ~^ {(reg39 ?
                      wire31 : (8'h9d)),
                  {wire24}})),
              (8'ha7)})
            begin
              reg41 <= $unsigned($signed($unsigned($signed($signed(reg33)))));
            end
          else
            begin
              reg41 <= {{wire22[(3'h5):(1'h0)]}};
              reg42 <= reg37[(2'h3):(1'h0)];
              reg43 <= $signed(((~$signed((!reg32))) == $signed(wire23)));
              reg44 <= ($unsigned((wire21 >> $unsigned(reg35[(1'h0):(1'h0)]))) < ($unsigned($signed((8'had))) ^ (reg32 - {$unsigned(wire23),
                  $unsigned(wire28)})));
            end
        end
      if (wire29)
        begin
          reg45 <= (($unsigned(($signed((8'h9f)) <= wire26[(4'h9):(3'h7)])) ?
                  reg44 : $signed($unsigned($unsigned(wire20)))) ?
              ((~^($signed(reg42) ? (~^reg40) : $signed(wire29))) ?
                  reg40 : reg39[(3'h6):(3'h6)]) : ({(-(!wire22))} && wire30));
          reg46 <= $signed(wire21);
          if (wire19)
            begin
              reg47 <= wire21[(3'h6):(3'h4)];
              reg48 <= {((reg43[(3'h6):(3'h5)] >= ((wire31 * reg47) ?
                      (reg42 ^~ (8'hbd)) : wire27[(1'h0):(1'h0)])) & {((wire28 ~^ wire21) * $signed(wire23)),
                      $signed({reg47})})};
              reg49 <= ((wire20[(3'h7):(3'h5)] | (wire31[(3'h4):(2'h2)] ?
                  ((8'ha5) ?
                      reg48[(2'h2):(1'h1)] : $unsigned(wire28)) : (|(wire31 ?
                      wire26 : (8'ha9))))) * $signed(($unsigned((wire30 != reg41)) << {$unsigned(reg48),
                  $signed((8'hb8))})));
              reg50 <= $signed(((wire31[(2'h2):(1'h1)] & reg44) == $unsigned(((wire30 ?
                  (7'h41) : wire20) >> reg41))));
              reg51 <= reg35;
            end
          else
            begin
              reg47 <= (~$unsigned($unsigned($signed((^reg35)))));
              reg48 <= $signed({({{(7'h42), wire22},
                          (reg49 ? reg32 : (7'h42))} ?
                      $signed($unsigned(wire29)) : reg46[(4'he):(3'h5)]),
                  $unsigned((^(reg36 ? reg47 : reg33)))});
              reg49 <= (~|reg47[(4'ha):(3'h5)]);
              reg50 <= ($signed((($unsigned(reg45) ?
                      {reg44} : (reg25 >= wire19)) ^ reg38)) ?
                  ((^(reg43 ? (-reg51) : reg36)) ?
                      $signed(wire19) : $signed((reg42 ?
                          $signed(reg25) : (~|reg35)))) : (wire23 <= (((wire26 || reg44) >> reg51[(1'h0):(1'h0)]) < (~|{reg43}))));
            end
          reg52 <= $unsigned(wire28[(4'h8):(3'h5)]);
          if (wire22[(3'h6):(3'h4)])
            begin
              reg53 <= ($signed(((~&$signed(wire29)) ^ (~^reg42))) != {(~|({reg36} <= $signed(reg49)))});
              reg54 <= (~&wire20[(3'h7):(3'h4)]);
            end
          else
            begin
              reg53 <= (8'h9d);
            end
        end
      else
        begin
          reg45 <= reg35;
          reg46 <= {wire28[(1'h0):(1'h0)]};
          reg47 <= wire26;
        end
    end
endmodule
