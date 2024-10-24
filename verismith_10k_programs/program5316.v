module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire72;
  assign y = {wire75, wire74, wire5, wire6, wire72, (1'h0)};
  assign wire5 = $signed($unsigned($signed(wire4)));
  assign wire6 = {($signed(((wire4 ?
                         wire1 : (8'hbc)) == wire5)) & $unsigned(($signed(wire5) && {wire2}))),
                     $signed($signed((8'h9e)))};
  module7 #() modinst73 (.wire11(wire0), .wire8(wire4), .wire9(wire6), .y(wire72), .wire12(wire5), .wire10(wire1), .clk(clk));
  assign wire74 = wire1[(4'ha):(4'h9)];
  assign wire75 = {(8'hb6)};
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire65;
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire13,
                 wire14,
                 wire26,
                 wire27,
                 wire65,
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
                 (1'h0)};
  assign wire13 = {(^~(!wire11[(1'h1):(1'h1)]))};
  assign wire14 = $signed((wire13 ?
                      $signed(wire12[(1'h0):(1'h0)]) : $signed(wire9)));
  always
    @(posedge clk) begin
      reg15 <= (($signed((wire9 ?
          {wire8, wire10} : wire11[(1'h1):(1'h1)])) && wire13) ^ ((&(~wire13)) ?
          (^~($signed(wire12) ?
              $signed((8'ha6)) : (wire8 >>> wire14))) : (wire12 ?
              (wire11 ^~ wire12[(3'h6):(3'h6)]) : {(~(8'h9e))})));
      reg16 <= wire14[(2'h2):(1'h1)];
      reg17 <= (reg16 > $unsigned((|((wire13 == wire9) ?
          (wire10 ? reg15 : reg15) : (7'h40)))));
      if (((wire11 ?
              {(!(wire10 ? reg17 : (8'hb5))),
                  $signed($signed((8'had)))} : reg17[(4'he):(4'h9)]) ?
          wire8 : (-wire11)))
        begin
          reg18 <= ($signed(wire12[(3'h6):(3'h4)]) ?
              $unsigned(((-$signed(wire8)) ^~ $unsigned(wire12[(2'h2):(1'h1)]))) : (|(&wire11[(2'h2):(1'h0)])));
          reg19 <= $signed(((($signed(wire9) << wire8) ?
                  $signed($unsigned(wire11)) : {$unsigned(wire10),
                      (wire13 - reg16)}) ?
              $unsigned(({wire11} ?
                  (wire8 ? wire14 : wire13) : (wire13 ?
                      reg18 : reg18))) : $signed($signed($unsigned(reg16)))));
          reg20 <= (+((wire12 < $unsigned(wire10)) ?
              ($unsigned((reg16 ?
                  (7'h44) : reg18)) <= wire9[(4'hd):(2'h2)]) : (($unsigned(reg19) ?
                      (wire11 ? wire13 : wire12) : $signed((8'ha4))) ?
                  $signed(wire9[(4'ha):(2'h3)]) : (~&(-wire10)))));
          reg21 <= $signed(($signed(wire13) ?
              ((wire9[(4'he):(1'h1)] == wire10[(4'hc):(3'h5)]) >>> wire8[(1'h0):(1'h0)]) : reg18[(1'h0):(1'h0)]));
          reg22 <= (wire11[(1'h0):(1'h0)] || wire14);
        end
      else
        begin
          reg18 <= $unsigned(({$unsigned($signed(wire12))} ?
              $signed((^(^(8'hbf)))) : (reg22 ^~ (reg15[(5'h11):(5'h11)] & reg22))));
          if (reg17)
            begin
              reg19 <= $unsigned($signed(($unsigned($unsigned(reg17)) || wire9)));
              reg20 <= reg18[(4'h8):(3'h4)];
            end
          else
            begin
              reg19 <= $signed($signed((reg19[(3'h5):(3'h4)] - (~^reg20[(4'h9):(2'h2)]))));
              reg20 <= (~$signed((+(^~(!reg16)))));
              reg21 <= $signed(((+$signed(reg21)) ?
                  {({reg20, (8'hb9)} ?
                          $signed(reg20) : $unsigned(reg19))} : {(&(|reg16))}));
              reg22 <= $signed(wire11[(1'h1):(1'h0)]);
            end
          reg23 <= (($signed(wire14) ?
              reg19 : {((+(8'ha8)) << $unsigned((8'hb5))),
                  $unsigned((-(8'ha8)))}) ^ reg20);
          reg24 <= $signed(((-(&reg21)) == {($signed(reg18) ?
                  (!wire8) : $unsigned(wire13))}));
          reg25 <= wire11;
        end
    end
  assign wire26 = {{{((8'haa) ?
                                  (reg16 & reg17) : (wire10 ?
                                      reg15 : (8'ha1)))}}};
  assign wire27 = $signed((-($unsigned((wire14 ? wire14 : reg20)) ?
                      (((7'h44) ?
                          reg24 : wire11) <<< $signed(reg22)) : reg18[(3'h4):(1'h0)])));
  module28 #() modinst66 (wire65, clk, reg20, wire10, reg24, reg17);
  assign wire67 = wire14;
  assign wire68 = (($signed((^~(wire10 == reg15))) && wire27[(3'h6):(2'h3)]) || {($signed(wire11) <= (~^(reg15 != wire27))),
                      $signed({$signed(reg22)})});
  assign wire69 = (((&($signed(wire9) < $signed(reg18))) > reg21[(2'h3):(1'h0)]) ?
                      $unsigned($signed(($signed(reg22) ?
                          {reg15} : (-wire9)))) : (^{(wire68[(4'he):(1'h0)] ?
                              wire12[(3'h7):(1'h0)] : {(7'h44)}),
                          $unsigned(reg15[(4'he):(4'hd)])}));
  assign wire70 = (|$unsigned($signed(reg21[(4'hf):(3'h7)])));
  assign wire71 = (!(wire13[(4'hf):(4'h9)] ?
                      reg24 : {reg24, $unsigned($unsigned(wire10))}));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire33;
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  assign y = {wire64,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire33,
                 reg63,
                 reg52,
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
                 (1'h0)};
  assign wire33 = ({$signed(wire29)} << wire30[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      if ($unsigned($signed(((&(!wire33)) <<< {wire33,
          (wire29 ? wire29 : wire32)}))))
        begin
          if ($unsigned(wire29[(4'hc):(1'h0)]))
            begin
              reg34 <= $signed({(wire33 ?
                      {$unsigned(wire30), wire33} : (^~(wire30 ?
                          wire32 : (8'hb4)))),
                  wire29[(4'hf):(4'ha)]});
              reg35 <= (((reg34[(4'hd):(4'hd)] == reg34) ?
                      $unsigned($unsigned($signed(reg34))) : wire30[(2'h2):(1'h0)]) ?
                  (($signed($unsigned(wire32)) ?
                          (wire32[(3'h7):(3'h7)] >> $signed(wire29)) : wire30[(1'h0):(1'h0)]) ?
                      ((((8'hac) ^~ wire31) ? (reg34 - wire32) : wire32) ?
                          wire32 : $signed(wire29)) : (~^$signed(wire33))) : reg34[(3'h5):(3'h5)]);
              reg36 <= reg34;
            end
          else
            begin
              reg34 <= ($signed((wire33[(3'h4):(2'h3)] <<< wire33)) || wire30[(3'h4):(2'h3)]);
              reg35 <= {reg35[(4'h9):(2'h3)]};
            end
        end
      else
        begin
          reg34 <= {reg34[(4'h9):(3'h5)],
              (!($unsigned($unsigned((8'hba))) && ((wire33 <= (8'hb6)) ?
                  {wire30, wire33} : (reg34 ? wire31 : reg34))))};
          reg35 <= (((!$unsigned($unsigned(wire32))) ^~ (7'h43)) ?
              wire33[(2'h2):(1'h1)] : wire31[(1'h1):(1'h0)]);
        end
      reg37 <= (~|(wire31[(3'h5):(2'h3)] - reg35[(4'hb):(3'h4)]));
      reg38 <= $unsigned((+($signed((wire31 ?
          (8'hbb) : wire30)) <= $signed(wire29))));
    end
  always
    @(posedge clk) begin
      reg39 <= wire29[(4'h8):(2'h2)];
      if ({(^~$unsigned((&$unsigned(reg35))))})
        begin
          reg40 <= wire30;
          reg41 <= wire29;
          if (($signed($unsigned(($signed(wire33) - (^wire29)))) < $unsigned({(^~(wire31 >> reg38))})))
            begin
              reg42 <= $signed((($signed($unsigned(reg38)) + ({reg37, wire30} ?
                  $signed(reg38) : (reg36 ?
                      wire29 : reg38))) - (~^(^~wire33[(4'h9):(3'h4)]))));
              reg43 <= {(~|(|reg36)),
                  $signed(({$signed(reg36)} ?
                      {reg34} : ($unsigned((8'hab)) >>> (reg34 == reg37))))};
              reg44 <= ((reg37 > {reg37[(2'h3):(2'h2)]}) ?
                  (8'hb0) : ($unsigned(({(8'had)} ?
                          $unsigned(reg42) : (|reg37))) ?
                      $signed(((|reg39) + wire31)) : (wire32[(1'h0):(1'h0)] + $signed(reg42[(1'h1):(1'h1)]))));
              reg45 <= $unsigned((^~wire33[(5'h11):(4'ha)]));
            end
          else
            begin
              reg42 <= ($signed($unsigned(((&(8'ha6)) ?
                      (reg37 ? reg40 : (8'ha4)) : reg37))) ?
                  ((|$signed((8'ha9))) ?
                      $unsigned((reg40[(4'h9):(1'h0)] ?
                          (wire30 - reg38) : $unsigned(reg37))) : ((-(reg37 ?
                          wire32 : (8'hb2))) >= $signed({reg40,
                          (8'hbf)}))) : wire30[(4'h8):(3'h6)]);
              reg43 <= (((~&(reg45 << (wire29 ? reg38 : wire29))) + {((reg40 ?
                          reg45 : (8'ha4)) ?
                      (reg39 + (8'had)) : {reg34})}) - wire30[(4'ha):(1'h1)]);
            end
          reg46 <= $signed((reg39[(3'h7):(1'h0)] ?
              (~reg38) : ((+$signed(wire33)) ?
                  ((~|reg40) >= (+reg43)) : ($signed(wire29) ?
                      (reg36 > (8'hb9)) : reg40))));
          reg47 <= (wire32[(1'h1):(1'h0)] <= wire29);
        end
      else
        begin
          reg40 <= (wire31[(3'h4):(2'h2)] ?
              $signed($signed((reg35 < (wire31 <= reg44)))) : (&reg40));
          reg41 <= ($signed((&((reg47 > reg36) ?
              $unsigned(reg43) : (8'ha4)))) < {(8'hbe),
              ((&$signed(wire31)) ? reg39 : reg47)});
          if ((reg41 ?
              $unsigned(wire33[(4'hf):(2'h3)]) : {(($unsigned(reg44) ?
                      reg43[(4'h8):(2'h3)] : wire32) <<< {wire32[(3'h4):(2'h3)],
                      (reg34 ? wire29 : reg42)}),
                  reg44[(3'h4):(2'h3)]}))
            begin
              reg42 <= reg39;
            end
          else
            begin
              reg42 <= $signed(reg40[(1'h1):(1'h0)]);
              reg43 <= $unsigned($signed(reg39));
            end
          reg44 <= (-{(^(+(reg35 ~^ wire33))),
              $signed(($unsigned(reg47) ?
                  (-reg39) : (reg36 ? wire33 : (8'ha1))))});
        end
    end
  assign wire48 = wire31;
  assign wire49 = ((wire32 ?
                          (-{(~&reg45),
                              (~reg43)}) : ($unsigned((reg40 < wire33)) ?
                              ({reg34,
                                  (8'hae)} < (reg42 - reg34)) : $signed(reg47[(4'hc):(1'h1)]))) ?
                      wire32 : (($signed((~wire29)) ^ (^(reg43 ?
                          (7'h40) : wire31))) != reg42));
  assign wire50 = (reg41 == {reg37[(1'h1):(1'h0)]});
  assign wire51 = $unsigned((wire33 <= ($signed((reg38 ? wire48 : reg47)) ?
                      wire48[(1'h1):(1'h0)] : (wire49[(5'h12):(4'hf)] >> (wire48 >> (8'hb5))))));
  always
    @(posedge clk) begin
      reg52 <= reg44[(2'h3):(1'h0)];
    end
  assign wire53 = wire51;
  assign wire54 = (reg43[(3'h4):(1'h0)] * reg36);
  assign wire55 = $unsigned(reg42[(1'h0):(1'h0)]);
  assign wire56 = reg38[(4'h9):(4'h8)];
  assign wire57 = $signed(wire48);
  assign wire58 = {wire31};
  assign wire59 = ($unsigned(wire30) ?
                      $signed(($unsigned((!reg36)) & reg52)) : reg34);
  assign wire60 = ($unsigned($unsigned(wire33[(2'h2):(1'h0)])) || wire30);
  assign wire61 = wire59[(2'h3):(2'h3)];
  assign wire62 = {reg35, $signed(wire58[(3'h4):(3'h4)])};
  always
    @(posedge clk) begin
      reg63 <= $unsigned(($signed(wire31) > $unsigned(wire56[(4'hb):(2'h3)])));
    end
  assign wire64 = (^~($signed($unsigned(reg40)) >> $signed((8'had))));
endmodule
