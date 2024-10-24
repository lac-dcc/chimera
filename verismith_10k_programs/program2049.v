module top
#(parameter param35 = (^~(((((8'hb4) ? (8'hb1) : (8'haa)) == (8'h9c)) ? (((8'hbb) ? (8'h9e) : (7'h41)) >= ((8'hb1) ? (8'ha0) : (8'ha9))) : (8'h9f)) ? (^~(((8'haf) ? (8'ha1) : (8'h9e)) ? (+(8'hb4)) : (~&(8'ha6)))) : (8'ha1))), 
parameter param36 = (~^(((~(param35 ? param35 : param35)) ? (8'ha8) : param35) ? ({((8'hb4) <<< (7'h44)), (param35 ? param35 : param35)} ? (|param35) : ({param35} > (param35 ~^ param35))) : {param35, (8'ha9)})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($signed({(^$signed(wire0)), wire1[(4'h8):(3'h5)]}));
      reg5 <= (8'had);
      if (((^~((!{wire1, (7'h40)}) & (-(reg4 == wire2)))) ?
          reg5 : wire0[(5'h11):(3'h6)]))
        begin
          reg6 <= reg4[(3'h5):(3'h5)];
          reg7 <= wire2[(3'h4):(1'h1)];
          if ({reg6,
              (($unsigned((-reg7)) > $unsigned({reg4})) ?
                  ({wire3[(3'h7):(3'h4)], (wire2 ? wire3 : (8'h9c))} ?
                      $signed((|reg7)) : reg6) : $unsigned(wire0[(4'h8):(2'h3)]))})
            begin
              reg8 <= $signed($signed(wire2));
              reg9 <= $signed($signed((~&reg4)));
              reg10 <= $signed((8'ha4));
              reg11 <= reg4;
              reg12 <= $signed((((~^(wire0 ^ reg7)) ?
                      (&(reg6 ? reg4 : reg6)) : ($unsigned(wire3) - {reg5,
                          reg6})) ?
                  (|((~reg9) < wire0)) : ($unsigned((wire3 ?
                      reg5 : wire1)) << $unsigned($signed((8'hae))))));
            end
          else
            begin
              reg8 <= $signed({($unsigned($signed((8'hac))) ?
                      reg6 : (wire1[(2'h2):(2'h2)] >> (reg10 ~^ reg4)))});
              reg9 <= ($unsigned({($signed(reg7) ? (-reg10) : $signed(reg5)),
                  $unsigned((^reg10))}) ~^ (^~wire0));
              reg10 <= $unsigned($signed(((reg5[(2'h2):(2'h2)] ?
                      (+reg8) : reg6) ?
                  reg12[(2'h2):(2'h2)] : ($unsigned(reg4) ?
                      (reg12 >= reg5) : reg10[(5'h12):(5'h12)]))));
              reg11 <= reg12[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg6 <= {($signed((reg12[(4'h8):(1'h1)] | $signed(reg9))) * reg9)};
          reg7 <= (!(({(+wire1), reg4} ?
              $signed({reg9,
                  reg11}) : reg10[(3'h6):(3'h4)]) ~^ reg6[(4'h9):(1'h1)]));
          reg8 <= ($signed(wire1[(3'h5):(3'h5)]) ?
              $unsigned((8'hbd)) : wire1[(3'h6):(2'h3)]);
        end
      reg13 <= (~^({((8'hb0) ~^ (reg12 << wire1)),
          (((8'haa) < (7'h40)) ?
              {(8'haf), wire2} : (|reg4))} ^ (($unsigned(reg8) - (reg7 ?
          reg5 : wire2)) ^ (8'hb1))));
    end
  assign wire14 = (wire0 ?
                      $unsigned(((|reg9[(2'h2):(1'h0)]) <= $signed((wire1 ?
                          wire0 : reg5)))) : reg10[(4'he):(3'h4)]);
  assign wire15 = ((!wire14) ?
                      $unsigned($signed((reg13[(3'h4):(2'h3)] ?
                          (~|(8'hbc)) : reg10))) : {$signed((&(wire1 >>> reg6))),
                          $unsigned(((~|reg8) ? (reg5 >>> reg5) : {wire1}))});
  assign wire16 = reg6;
  assign wire17 = $signed((reg9[(3'h4):(1'h0)] || (^~(wire16[(3'h5):(1'h1)] != ((8'hb5) ?
                      wire2 : (8'haf))))));
  assign wire18 = $unsigned($unsigned({(wire17 ?
                          (wire15 ? reg6 : reg7) : (wire0 ? (8'hb3) : wire1)),
                      wire0[(3'h5):(3'h5)]}));
  assign wire19 = reg10;
  assign wire20 = $unsigned(((&$signed($signed((8'hb4)))) <= (~&(!wire16))));
  assign wire21 = (~|wire20[(3'h5):(2'h3)]);
  assign wire22 = reg10[(4'hd):(4'ha)];
  assign wire23 = ((!(($signed((8'ha5)) <= (wire22 ? wire18 : wire22)) ?
                          {$signed(reg11)} : $unsigned(wire22[(2'h2):(1'h0)]))) ?
                      wire17 : (^~$unsigned(((!wire1) >> reg13))));
  assign wire24 = $signed($unsigned($signed($signed($signed(wire0)))));
  assign wire25 = reg4;
  assign wire26 = reg7;
  always
    @(posedge clk) begin
      if ({(({$signed(wire20)} ?
                  $unsigned($signed(wire26)) : (((7'h41) ?
                      reg4 : wire1) <<< wire22[(4'h9):(1'h0)])) ?
              (wire3 ?
                  reg9[(4'ha):(3'h5)] : $unsigned($unsigned(wire26))) : (reg11 != $signed(reg4))),
          ($signed(wire24) ?
              (8'hb3) : $unsigned(((~(7'h43)) >>> (wire0 ? reg13 : (8'ha7)))))})
        begin
          reg27 <= $unsigned(reg6);
          reg28 <= wire22;
          if (({(wire21 ?
                      $signed((^~(8'hab))) : ({wire2,
                          reg10} && $unsigned((8'hb4))))} ?
              ($signed(((reg12 ? reg27 : reg9) ~^ wire22[(3'h5):(1'h0)])) ?
                  $signed(wire1) : (reg5 != {{wire2,
                          reg27}})) : (reg13[(2'h3):(2'h2)] - ({(wire19 ?
                      reg7 : reg27),
                  wire19[(5'h13):(4'hf)]} || wire0[(2'h3):(2'h3)]))))
            begin
              reg29 <= wire20;
              reg30 <= $unsigned($signed((($unsigned(wire24) > $unsigned(reg10)) >>> $unsigned((!wire21)))));
              reg31 <= ((~&wire16[(2'h2):(1'h0)]) ?
                  wire0[(5'h12):(3'h5)] : reg29[(3'h7):(1'h0)]);
              reg32 <= (wire23[(4'h8):(1'h1)] ?
                  $unsigned((&reg8[(1'h1):(1'h1)])) : $unsigned(wire23[(2'h2):(1'h0)]));
            end
          else
            begin
              reg29 <= (reg30 ?
                  wire15 : $signed((~&$unsigned($unsigned(wire3)))));
            end
          reg33 <= reg13[(4'ha):(2'h3)];
          reg34 <= $signed(reg5[(2'h2):(1'h0)]);
        end
      else
        begin
          reg27 <= (wire1 ? wire3 : wire26);
          reg28 <= $unsigned($unsigned($signed(reg7)));
          reg29 <= ($unsigned(reg32[(3'h5):(2'h2)]) + (($unsigned($unsigned(wire25)) ?
              ($unsigned(reg32) ?
                  (reg31 ?
                      reg8 : reg4) : (reg11 != wire18)) : ($unsigned(reg9) == $unsigned(wire18))) ^~ $unsigned((&$signed((8'ha6))))));
          reg30 <= (^((+wire25[(4'hd):(3'h4)]) ? wire16 : wire19));
        end
    end
endmodule
