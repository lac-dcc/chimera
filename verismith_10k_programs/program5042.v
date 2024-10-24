module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  assign y = {wire70, wire69, wire67, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0[(3'h5):(1'h1)];
  assign wire5 = (wire3 ?
                     wire1 : {({$unsigned(wire1),
                             (+wire4)} << ($unsigned((8'hbd)) ?
                             {(8'hab), wire3} : ((8'hb8) << wire2)))});
  assign wire6 = wire4;
  module7 #() modinst68 (.wire11(wire6), .wire9(wire5), .clk(clk), .y(wire67), .wire8(wire4), .wire10(wire0));
  assign wire69 = (8'h9d);
  assign wire70 = {({$signed(wire5[(5'h13):(1'h1)]),
                          wire3[(1'h0):(1'h0)]} & ((8'hbb) ?
                          (((8'hb8) ?
                              wire67 : wire5) | wire67[(1'h0):(1'h0)]) : wire3[(2'h2):(1'h0)])),
                      wire2[(3'h4):(2'h2)]};
endmodule

module module7
#(parameter param66 = (8'hbc))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire45;
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  assign y = {wire65,
                 wire48,
                 wire47,
                 wire45,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  module12 #() modinst46 (.y(wire45), .wire14(wire10), .wire15(wire8), .wire13((8'h9e)), .wire17(wire11), .wire16(wire9), .clk(clk));
  assign wire47 = wire8;
  assign wire48 = $unsigned((wire47[(4'h9):(3'h5)] * (wire8[(3'h6):(2'h3)] ?
                      (~&(wire45 & (8'hb2))) : $signed($unsigned(wire11)))));
  always
    @(posedge clk) begin
      if ((^~wire11))
        begin
          reg49 <= $unsigned($unsigned(($signed(wire10[(1'h0):(1'h0)]) ?
              (~wire47) : $signed(wire47))));
          reg50 <= {$unsigned(($unsigned((-wire8)) ?
                  {$signed((8'h9e))} : ((^~wire10) ?
                      $signed(reg49) : reg49[(2'h2):(1'h1)]))),
              ((8'ha4) >= (8'hb5))};
          if ((8'ha1))
            begin
              reg51 <= $signed(reg49[(1'h1):(1'h1)]);
              reg52 <= wire11[(3'h7):(2'h2)];
            end
          else
            begin
              reg51 <= ((-wire10[(4'ha):(2'h2)]) < wire11[(2'h3):(1'h0)]);
              reg52 <= (-$unsigned(((((8'ha4) >> wire45) ?
                      (wire10 >>> reg49) : (wire47 ? (8'hbb) : (8'hb1))) ?
                  wire8 : ($signed(reg51) ? $unsigned(wire48) : (&wire45)))));
              reg53 <= (wire45[(4'he):(4'ha)] & {$signed(((~|wire9) | $unsigned(wire10)))});
              reg54 <= $signed(reg49);
            end
          reg55 <= {$unsigned(wire11)};
          if ((!reg53))
            begin
              reg56 <= (~|$unsigned(wire11[(2'h2):(2'h2)]));
              reg57 <= $signed((({reg54, (reg50 ? reg51 : wire11)} ?
                  wire8[(3'h7):(3'h6)] : ($unsigned(reg56) ?
                      {(8'h9e), wire48} : (~^(8'had)))) > wire47));
              reg58 <= ((wire11[(4'h8):(1'h0)] >= reg57) || $unsigned($signed($unsigned((^(8'haf))))));
            end
          else
            begin
              reg56 <= (|((~^((|wire47) ^~ $signed((8'haf)))) ?
                  ($unsigned($unsigned(wire11)) || wire45[(4'h8):(3'h5)]) : (^((&wire9) || ((8'hbf) || wire8)))));
            end
        end
      else
        begin
          reg49 <= $signed({$signed(wire10[(3'h7):(2'h2)]), {reg57}});
          reg50 <= (($signed($unsigned($signed(reg53))) - $unsigned(reg58[(3'h5):(2'h2)])) ?
              wire8 : (wire9 + (wire9 + {$unsigned(reg51), $signed(wire11)})));
        end
      reg59 <= $unsigned({$unsigned(reg52)});
      reg60 <= (^~($unsigned((8'hbc)) != ({(wire10 ? wire48 : wire47)} ?
          $unsigned({(8'haa)}) : $signed(((8'ha7) ? wire9 : reg51)))));
      if ((wire47[(3'h6):(1'h0)] > {(~&wire45[(2'h2):(1'h0)])}))
        begin
          reg61 <= reg57[(1'h0):(1'h0)];
        end
      else
        begin
          reg61 <= wire9[(4'h8):(3'h4)];
          reg62 <= $signed($unsigned(((wire9[(1'h1):(1'h0)] ?
              $unsigned(wire11) : (reg53 != reg49)) << $unsigned((reg52 < reg51)))));
          reg63 <= reg59[(4'hd):(3'h5)];
        end
      reg64 <= ($unsigned(((8'ha8) ^~ (~^(|reg58)))) ?
          (^~$unsigned({reg53[(4'hb):(3'h6)], (|reg57)})) : (!(~&((reg60 ?
              reg53 : reg50) ^~ (wire8 << reg55)))));
    end
  assign wire65 = $signed(reg60);
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  assign y = {wire39,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((-(^~$signed((|(wire16 ? wire16 : wire17))))))
        begin
          reg18 <= (+(^(&$signed((wire16 << wire13)))));
          reg19 <= ($unsigned(($signed(wire14) ?
                  $unsigned($signed(wire13)) : $unsigned($signed((8'hb0))))) ?
              {$signed(wire15)} : wire15[(2'h2):(2'h2)]);
          if (((^~(-$unsigned((wire13 ? (8'haa) : (8'hab))))) ?
              $unsigned({reg19[(3'h5):(1'h0)]}) : $unsigned((^$signed(reg19[(2'h3):(2'h3)])))))
            begin
              reg20 <= (($signed({(|(8'ha3)),
                      (reg19 ? reg19 : wire16)}) > $unsigned(({wire14,
                      reg18} | ((8'hbd) ? wire15 : (8'hac))))) ?
                  wire16 : (^((wire14[(2'h2):(1'h1)] ?
                      (reg18 ? (8'hac) : wire14) : $signed(wire14)) < reg19)));
              reg21 <= ({reg19[(1'h0):(1'h0)],
                  {$unsigned($signed(wire15))}} || {wire16});
              reg22 <= (wire13[(2'h2):(1'h1)] ? (!reg20) : $signed(reg20));
            end
          else
            begin
              reg20 <= (~^$signed(($signed($unsigned((8'hac))) + $signed($signed(wire13)))));
              reg21 <= {($unsigned($unsigned(reg19)) > (reg19 ?
                      ((wire15 ? reg22 : reg20) ?
                          wire16 : $signed(reg19)) : $signed($unsigned(wire14))))};
            end
          reg23 <= ($signed((^~($signed(wire17) << $unsigned(wire13)))) == reg22);
        end
      else
        begin
          if (reg21[(1'h0):(1'h0)])
            begin
              reg18 <= {$signed({wire13, reg20}),
                  (+$signed(wire13[(4'hc):(3'h5)]))};
              reg19 <= {wire14[(1'h0):(1'h0)]};
            end
          else
            begin
              reg18 <= reg22;
              reg19 <= reg21;
              reg20 <= $signed($unsigned((~&$unsigned($unsigned(reg19)))));
              reg21 <= (^({reg21[(2'h2):(1'h0)],
                  wire14} >>> (wire15 << $unsigned((wire17 || wire16)))));
            end
          reg22 <= reg20;
          reg23 <= wire17[(4'ha):(4'ha)];
          if ($signed((reg23[(1'h1):(1'h0)] ?
              (wire13[(5'h10):(1'h1)] | {wire15[(3'h7):(1'h0)],
                  (reg18 ? reg20 : reg22)}) : wire17)))
            begin
              reg24 <= reg23;
              reg25 <= (((reg24 != (&(~|reg24))) << (reg21[(3'h4):(3'h4)] || $signed($unsigned(wire17)))) ^ ((~^wire16) ?
                  $unsigned($signed(reg24[(2'h2):(1'h0)])) : (!($signed(wire16) && (^reg22)))));
              reg26 <= reg20;
              reg27 <= (wire16 ?
                  ((8'had) >= $unsigned(($signed(reg18) ?
                      wire17 : (~^reg19)))) : ($signed($signed((wire13 < reg23))) ?
                      (~^$unsigned(reg24[(4'ha):(3'h4)])) : (((reg24 ?
                              reg24 : (8'ha1)) ?
                          ((8'ha6) << reg21) : $signed(wire15)) && $signed((8'hbc)))));
            end
          else
            begin
              reg24 <= $signed($signed(reg18[(3'h7):(1'h1)]));
              reg25 <= $unsigned((+(+(~^reg24))));
            end
        end
      reg28 <= (reg27 << {($unsigned(wire17) ?
              (~|reg22[(2'h2):(2'h2)]) : (!reg19)),
          (reg20 ?
              (wire17 ?
                  reg27[(2'h3):(1'h1)] : {(7'h43),
                      reg27}) : (wire13[(1'h1):(1'h0)] ?
                  (reg24 ? (8'ha7) : reg23) : reg26[(2'h3):(2'h2)]))});
    end
  assign wire29 = ((8'hbf) - reg18[(4'h8):(3'h4)]);
  assign wire30 = $signed((~|(~&wire13)));
  assign wire31 = $unsigned((8'haf));
  assign wire32 = wire16;
  always
    @(posedge clk) begin
      reg33 <= $signed(((|reg18) >= wire31));
      if (((~&reg22) ? (&reg21[(2'h2):(1'h1)]) : reg28))
        begin
          if ((~wire17))
            begin
              reg34 <= ($unsigned(({wire13[(1'h0):(1'h0)]} | reg23[(4'he):(4'he)])) ?
                  (8'hb9) : $unsigned((reg25 ?
                      {(reg27 ? reg25 : reg25), reg28} : $unsigned({wire30}))));
              reg35 <= (8'h9c);
              reg36 <= (reg28[(3'h5):(1'h1)] ~^ ($unsigned(($signed(wire13) ?
                  $signed(wire31) : (wire16 > (8'hba)))) - $unsigned(((reg19 - wire32) != {reg24,
                  reg22}))));
            end
          else
            begin
              reg34 <= (($unsigned(reg28) ^ (((!wire15) <<< $signed(reg36)) ?
                      (wire29[(1'h1):(1'h0)] ?
                          (reg20 ~^ reg23) : wire17) : $unsigned((-reg22)))) ?
                  reg27 : $signed((reg34[(4'hb):(2'h2)] ?
                      reg25 : reg21[(1'h1):(1'h0)])));
              reg35 <= $signed(reg24);
              reg36 <= wire13[(3'h6):(2'h2)];
              reg37 <= $unsigned(({((^~reg27) < (~^reg28))} != (reg25 < ((wire17 && reg24) >= (~&(8'hae))))));
            end
          reg38 <= $signed(wire16);
        end
      else
        begin
          reg34 <= ((($unsigned({reg28, reg26}) + $unsigned({wire17,
              wire32})) + ({{reg34}, (~reg20)} ?
              (reg34 - $unsigned(reg26)) : {(reg20 >> wire17)})) ~^ {$signed((wire15 >> reg27[(3'h7):(3'h7)])),
              wire31});
          reg35 <= $signed(((((!wire15) >> {wire15, reg20}) ?
                  $unsigned((^reg34)) : ($unsigned(reg25) == ((8'hb6) ?
                      reg25 : (8'ha2)))) ?
              ((reg34 & {wire32, reg38}) <= ((~reg19) && (reg19 ?
                  reg38 : reg33))) : reg34));
          reg36 <= (($signed(reg18) ?
              $unsigned($signed((reg18 & wire31))) : wire16[(4'h9):(3'h4)]) >= reg35);
          reg37 <= ((wire30[(2'h3):(1'h1)] << (reg28[(2'h2):(1'h1)] >>> (^~reg33))) ^ {$unsigned($signed(reg27[(3'h5):(1'h1)])),
              $signed((~&reg21))});
        end
    end
  assign wire39 = $signed($unsigned(wire14));
  always
    @(posedge clk) begin
      reg40 <= (^$unsigned(($unsigned(reg25) & ((reg36 || reg38) ?
          (^~reg34) : (reg23 & wire32)))));
      reg41 <= $unsigned((|(8'h9f)));
      reg42 <= ((|(wire32 | reg38)) ?
          ($unsigned(reg22) ?
              {reg20} : $signed(((reg21 ? (7'h41) : wire17) ?
                  (wire39 != (8'ha0)) : wire14[(2'h2):(1'h0)]))) : reg25[(3'h4):(2'h3)]);
      reg43 <= (-(-$signed(wire13)));
      if (reg25[(1'h0):(1'h0)])
        begin
          reg44 <= ({{reg21[(1'h1):(1'h0)],
                      ({wire15, (8'ha4)} ?
                          $unsigned(wire39) : $unsigned((8'hb9)))}} ?
              (reg23[(4'h8):(3'h5)] ?
                  (~^(-(^(8'ha6)))) : (((~^wire39) | $signed(wire15)) * ((8'ha0) ?
                      (~reg18) : reg38))) : reg26[(1'h1):(1'h1)]);
        end
      else
        begin
          reg44 <= $signed(reg25[(4'h9):(4'h8)]);
        end
    end
endmodule
