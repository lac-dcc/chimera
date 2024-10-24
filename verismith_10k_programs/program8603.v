module top
#(parameter param56 = ((^~(((8'ha1) ? ((8'ha5) ? (8'h9f) : (8'ha2)) : ((8'ha8) ? (8'ha5) : (7'h41))) + ({(7'h44), (8'hb2)} & ((8'h9d) > (7'h43))))) * (~^((8'hbb) && (^(|(8'ha6)))))), 
parameter param57 = (&(param56 ? ((~&param56) ? param56 : ((param56 ^ param56) * (param56 ? (8'hb9) : param56))) : (~(8'ha7)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire55,
                 wire53,
                 wire15,
                 wire4,
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
  assign wire4 = (|wire2);
  always
    @(posedge clk) begin
      reg5 <= {(wire2[(3'h4):(2'h3)] ? (~(|wire3[(3'h7):(3'h7)])) : wire4)};
      reg6 <= wire2[(1'h0):(1'h0)];
      if ($unsigned(wire1))
        begin
          reg7 <= $signed($signed(wire0[(1'h0):(1'h0)]));
          if ($signed(wire2))
            begin
              reg8 <= (reg6[(2'h2):(1'h0)] ? (8'hb5) : (8'hba));
              reg9 <= $signed((~&$unsigned({(reg5 ? wire0 : reg6),
                  (~(8'ha6))})));
              reg10 <= reg7[(1'h0):(1'h0)];
              reg11 <= reg10[(4'h9):(3'h5)];
              reg12 <= wire2;
            end
          else
            begin
              reg8 <= (~^reg9[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          if ($signed($unsigned($signed($unsigned((~wire3))))))
            begin
              reg7 <= $signed((reg10 ?
                  ((-(reg5 <<< reg8)) - {(reg11 != (8'h9f)),
                      $unsigned(reg12)}) : (^(^wire2[(1'h1):(1'h0)]))));
              reg8 <= (~^reg6);
              reg9 <= ({$unsigned(wire2[(4'hc):(4'hb)]),
                      {reg8[(2'h2):(2'h2)]}} ?
                  $signed((^wire4[(4'he):(3'h6)])) : $signed((reg5[(2'h2):(1'h1)] ?
                      $unsigned((reg11 <= reg6)) : $unsigned((&(8'haa))))));
              reg10 <= ((wire2 << (reg6 >> $signed((~wire1)))) ~^ (((wire2[(4'hc):(2'h3)] >> reg7) ^ wire0) ?
                  {reg10[(4'h9):(1'h1)],
                      $signed((+wire2))} : reg6[(1'h0):(1'h0)]));
            end
          else
            begin
              reg7 <= ($signed((~|((wire1 == reg6) ?
                      {reg10} : $unsigned(reg7)))) ?
                  {(!(!$signed(reg11))),
                      ((^(wire3 | wire1)) * $unsigned((reg6 & wire1)))} : ($unsigned($signed((wire2 & reg6))) ?
                      $unsigned(reg10[(4'h8):(3'h7)]) : ((&$signed((8'haa))) + ((reg7 ?
                              wire0 : (8'ha2)) ?
                          {wire4, wire3} : (reg12 ? reg12 : wire3)))));
              reg8 <= reg10;
              reg9 <= ((($unsigned((reg8 ?
                      (7'h43) : wire0)) <= wire3) << (-(~&(reg7 >= reg6)))) ?
                  ({reg8} < ({$unsigned(wire3)} ~^ (reg8 && (reg8 ?
                      reg10 : (8'h9e))))) : wire4[(4'h9):(1'h0)]);
            end
          if ((~|reg6))
            begin
              reg11 <= ($unsigned(($signed($unsigned(reg9)) ?
                      (!$unsigned(reg11)) : ((|reg11) ?
                          $signed(wire3) : $signed((8'hac))))) ?
                  $signed((~|(((8'ha5) ?
                      reg7 : (7'h42)) - {wire3}))) : (~$signed($unsigned((reg10 <<< wire4)))));
            end
          else
            begin
              reg11 <= reg11;
            end
          reg12 <= $signed($signed((8'hb0)));
          reg13 <= $signed($signed($signed($unsigned((-wire2)))));
          reg14 <= reg12;
        end
    end
  assign wire15 = ($unsigned({$signed(reg12),
                      reg11[(2'h3):(2'h3)]}) - {(((wire4 ~^ reg6) > (reg11 >>> (8'ha7))) && (reg5[(4'hd):(4'hd)] >>> wire0[(2'h2):(2'h2)]))});
  module16 #() modinst54 (.wire20(wire3), .clk(clk), .wire19(wire0), .y(wire53), .wire18(reg13), .wire17(reg9));
  assign wire55 = (wire1[(1'h0):(1'h0)] ?
                      $unsigned((reg13[(4'ha):(3'h7)] ?
                          reg11 : reg10)) : wire0[(4'h8):(3'h4)]);
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  assign y = {wire51, wire23, wire22, wire21, (1'h0)};
  assign wire21 = wire19[(4'hb):(3'h6)];
  assign wire22 = wire20;
  assign wire23 = {wire18[(5'h10):(1'h1)],
                      ($signed($unsigned((&wire18))) && ((8'ha7) >= (8'hb1)))};
  module24 #() modinst52 (.clk(clk), .y(wire51), .wire28(wire18), .wire27(wire19), .wire25(wire23), .wire26(wire17));
endmodule

module module24
#(parameter param49 = ({(~&({(7'h40)} | ((7'h43) ~^ (8'hb8))))} ? (((((8'hb4) ? (8'ha5) : (8'h9d)) * (+(8'hbe))) >> ((~&(8'hbd)) * (^(8'hb5)))) ? (((-(8'ha3)) + {(8'had), (8'ha9)}) && ((-(8'hba)) || (|(8'hb8)))) : (~&(((8'h9c) == (8'hb8)) & {(8'ha6), (8'hb6)}))) : (((~|{(8'hb5)}) ^~ (~&((8'ha0) ? (8'hba) : (8'ha9)))) == ((~((8'hbf) >>> (8'ha9))) - (^~((7'h44) >> (8'hbf)))))), 
parameter param50 = (~&param49))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire signed [(4'hc):(1'h0)] wire27;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire29 = $unsigned((~|(7'h44)));
  assign wire30 = ({{wire26}} ?
                      wire29[(3'h4):(1'h1)] : $unsigned(wire29[(1'h1):(1'h0)]));
  assign wire31 = wire26;
  assign wire32 = $signed($unsigned($signed((wire28 | wire26))));
  assign wire33 = (^~((((~&wire32) == $signed(wire25)) << {wire31,
                      wire32}) == ((^((8'haa) << wire25)) + $signed($unsigned((8'hbb))))));
  assign wire34 = (~|((wire26 ?
                      {(wire26 ?
                              wire30 : wire25)} : $unsigned(wire30)) * $unsigned((!(wire32 ?
                      wire31 : wire26)))));
  assign wire35 = $signed((~^wire31));
  assign wire36 = ((^~{(|(wire28 ? wire26 : wire34)),
                      (~(wire32 ^~ (8'hbb)))}) && (7'h41));
  assign wire37 = {$unsigned(wire32[(3'h4):(1'h1)]),
                      $unsigned($unsigned($unsigned(wire29)))};
  assign wire38 = $unsigned(wire33[(1'h0):(1'h0)]);
  assign wire39 = $unsigned($signed({wire38[(3'h6):(3'h5)], (8'had)}));
  assign wire40 = (wire38[(3'h4):(3'h4)] ?
                      wire29 : ((^((wire37 ? wire25 : wire27) ?
                              wire27[(4'h9):(1'h0)] : (wire36 ?
                                  wire31 : wire35))) ?
                          (^~($unsigned(wire30) <= (wire28 ?
                              wire25 : wire38))) : {(wire39 ~^ wire26[(3'h6):(1'h0)])}));
  assign wire41 = ($signed(wire29[(2'h2):(1'h0)]) >> $signed(($signed((7'h44)) << {((8'h9d) | wire37),
                      ((8'ha0) ? wire29 : wire25)})));
  assign wire42 = ((8'ha3) ^ $unsigned(wire28[(5'h11):(3'h4)]));
  assign wire43 = (($signed($unsigned({wire26,
                          wire36})) < (~&($unsigned((8'ha5)) ?
                          wire26 : $unsigned(wire30)))) ?
                      wire41[(2'h3):(1'h0)] : (~&$unsigned(wire33[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg44 <= $signed($signed((wire32 ^~ ({wire30} ?
          (wire28 ? wire32 : wire31) : $signed(wire34)))));
      reg45 <= ({wire39[(5'h12):(5'h10)], wire28} ?
          wire32 : (&$unsigned(wire39)));
      if (wire40)
        begin
          reg46 <= ($unsigned(wire40) < {(~|wire40[(4'h9):(3'h5)]),
              (wire39 >> {{wire37, wire29}, wire32})});
        end
      else
        begin
          reg46 <= wire37;
        end
    end
  assign wire47 = (|$unsigned($unsigned(($unsigned(wire32) || $signed(wire39)))));
  assign wire48 = (~&wire47[(1'h0):(1'h0)]);
endmodule
