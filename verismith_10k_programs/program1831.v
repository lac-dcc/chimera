module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire54;
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire57, wire7, wire54, reg56, reg6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned($signed($signed((wire4 >>> wire3)))) ?
          ((($unsigned(wire2) ? wire1 : (^wire2)) ?
                  ((wire3 + (8'hb1)) & $signed(wire0)) : (wire4[(2'h3):(2'h3)] ?
                      (wire1 >= wire3) : $unsigned(wire0))) ?
              {$unsigned((^~wire4)),
                  ((wire0 ? wire2 : wire2) * {wire0})} : (wire3[(4'h8):(1'h1)] ?
                  {wire0, wire4} : {wire1[(1'h0):(1'h0)]})) : (~&(({wire4,
                  wire0} <<< (|wire4)) ?
              ((wire1 & (8'haa)) ?
                  {(7'h44),
                      (8'h9f)} : wire2) : $unsigned(((8'hb0) >> wire1)))));
      reg6 <= $unsigned((wire0[(4'h9):(2'h2)] ?
          wire4 : $unsigned((wire3[(1'h1):(1'h0)] < (wire0 == wire1)))));
    end
  assign wire7 = (8'hbc);
  module8 #() modinst55 (.y(wire54), .wire13(reg5), .wire10(wire2), .wire9(wire3), .clk(clk), .wire12(reg6), .wire11(wire4));
  always
    @(posedge clk) begin
      reg56 <= (reg5 << (!(+wire54[(3'h5):(3'h5)])));
    end
  assign wire57 = (~^({(!{reg5})} ?
                      (reg5 ?
                          wire0[(3'h5):(2'h3)] : (((8'ha4) >= (8'h9f)) ?
                              (~&(8'hb1)) : $unsigned(wire1))) : (+$unsigned($unsigned((8'had))))));
endmodule

module module8
#(parameter param52 = (8'ha2), 
parameter param53 = (8'ha0))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire25,
                 wire24,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
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
                 (1'h0)};
  assign wire14 = (^~$unsigned(($unsigned(wire10) <= $signed((wire10 < wire9)))));
  assign wire15 = $signed(wire14);
  assign wire16 = {(^wire15)};
  assign wire17 = ((^$unsigned(wire13)) ?
                      wire10[(2'h3):(1'h1)] : (&wire12[(5'h11):(4'ha)]));
  assign wire18 = wire15;
  always
    @(posedge clk) begin
      if (wire11)
        begin
          reg19 <= $signed($unsigned(wire14[(3'h6):(3'h4)]));
          reg20 <= {$signed((^(!(wire12 <<< wire10)))), wire9};
        end
      else
        begin
          reg19 <= wire9[(1'h1):(1'h0)];
        end
      reg21 <= wire16;
      reg22 <= $unsigned(wire17);
      reg23 <= wire18;
    end
  assign wire24 = reg20[(1'h0):(1'h0)];
  assign wire25 = ($unsigned($signed(((wire18 & wire12) ?
                      (reg20 ?
                          wire15 : wire17) : (reg19 || wire16)))) >= ((((!wire17) ?
                              (wire14 ?
                                  wire11 : wire15) : (wire10 == (8'haa))) ?
                          $signed((wire9 ?
                              reg21 : wire10)) : wire24[(3'h4):(3'h4)]) ?
                      (!(&reg23[(4'hb):(4'hb)])) : wire18[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg26 <= $signed({wire13[(1'h1):(1'h1)]});
      reg27 <= {$signed(((~|$unsigned(reg26)) >= $signed(wire15)))};
      reg28 <= wire13;
      if ((|$signed((8'ha3))))
        begin
          if (reg28)
            begin
              reg29 <= {{({wire25} >> (((8'ha8) >> reg27) ?
                          $unsigned(wire24) : reg27[(4'hb):(3'h6)]))},
                  $unsigned(wire13)};
              reg30 <= (($unsigned($unsigned((wire13 ? reg22 : reg20))) ?
                  (~^$unsigned($unsigned(reg23))) : (wire9[(3'h4):(2'h2)] ?
                      (8'h9d) : wire13)) | reg29[(4'hf):(4'h8)]);
              reg31 <= wire25;
              reg32 <= reg26[(1'h0):(1'h0)];
            end
          else
            begin
              reg29 <= $signed($unsigned((reg19[(1'h0):(1'h0)] ^~ ({(8'hb4),
                      wire15} ?
                  wire24[(4'he):(2'h3)] : $signed(reg28)))));
            end
          if ({wire12[(4'hd):(1'h0)], reg29})
            begin
              reg33 <= ((({reg21[(1'h0):(1'h0)],
                      $signed(wire14)} == ((wire25 >>> reg19) ?
                      reg29 : wire11[(2'h2):(2'h2)])) ?
                  $unsigned($unsigned((reg27 ?
                      reg19 : reg29))) : $signed(reg29)) || (~|$unsigned(reg22)));
              reg34 <= $unsigned($signed($unsigned(wire14[(4'h8):(2'h2)])));
              reg35 <= (~(wire18[(3'h4):(1'h1)] >>> $signed({$unsigned((8'h9c)),
                  (-wire10)})));
              reg36 <= (wire24 ? wire25 : $signed((reg29 - (8'hba))));
              reg37 <= $signed((($signed({reg21}) ?
                      $unsigned($unsigned(wire18)) : reg34) ?
                  (~&wire13[(1'h1):(1'h1)]) : $signed(((reg22 ?
                          (8'hab) : (8'hae)) ?
                      (wire11 ~^ wire24) : (reg21 | wire12)))));
            end
          else
            begin
              reg33 <= $signed(($unsigned($signed(reg22[(2'h2):(1'h0)])) ?
                  (|$unsigned((~reg22))) : (^~reg37)));
              reg34 <= ((((8'hb2) >>> $signed(wire11[(3'h5):(3'h4)])) ?
                  (($unsigned(wire11) <= $signed((8'hb3))) ?
                      $unsigned((!reg35)) : wire18) : ($signed($unsigned(wire9)) ?
                      $unsigned(reg27[(3'h5):(3'h4)]) : ((8'h9e) >> (wire10 ?
                          reg27 : wire14)))) || {$signed($signed(wire17))});
              reg35 <= (~^(($unsigned((-reg29)) ?
                      $unsigned(reg34) : ({reg19} & (reg23 | wire13))) ?
                  {(reg26[(3'h5):(3'h4)] == reg32[(1'h1):(1'h1)])} : ((~reg29[(4'he):(4'h9)]) ?
                      (7'h42) : {wire12, $unsigned(wire16)})));
              reg36 <= reg33[(2'h3):(1'h0)];
            end
          reg38 <= $signed($signed($signed((reg21[(2'h3):(2'h2)] ?
              (reg19 ? (8'hac) : reg21) : wire16[(1'h0):(1'h0)]))));
          reg39 <= (wire9 ?
              (((-(wire14 == (8'ha7))) ? wire16 : wire25[(3'h6):(3'h4)]) ?
                  reg26 : ($unsigned((wire17 + wire9)) ?
                      wire17[(2'h3):(1'h0)] : {(wire10 ? reg21 : (7'h42)),
                          wire16[(4'h9):(3'h5)]})) : ((reg22 ?
                      wire25[(3'h6):(2'h2)] : ((wire15 << (8'ha1)) ?
                          $unsigned(reg38) : (wire12 << reg27))) ?
                  reg20 : wire25[(3'h4):(2'h3)]));
        end
      else
        begin
          reg29 <= $unsigned((!$signed(wire14)));
          reg30 <= {reg34,
              ((!(-(-wire25))) ?
                  ((reg30[(3'h7):(1'h1)] == (reg35 - wire12)) ?
                      reg19 : {(reg28 ?
                              (8'hbb) : (8'h9e))}) : $signed(reg29[(4'ha):(3'h5)]))};
          reg31 <= $signed(($signed($signed((wire17 ?
              reg32 : reg37))) & $unsigned({(^reg22), (~&(8'haf))})));
        end
      if ((~^wire12))
        begin
          reg40 <= reg30;
          reg41 <= (reg31 ?
              $signed($unsigned($signed($signed(reg26)))) : (^wire18));
          reg42 <= wire17[(1'h0):(1'h0)];
          reg43 <= (!(reg36 ?
              $signed((8'hbe)) : $signed(($unsigned(reg42) ?
                  (reg28 ? reg34 : reg19) : (reg21 | reg30)))));
          reg44 <= $unsigned($signed((+reg22)));
        end
      else
        begin
          reg40 <= wire15[(1'h0):(1'h0)];
          if (($unsigned(reg44) ?
              ($unsigned({((8'hae) - wire11),
                  (!reg22)}) > wire16) : {{(~^$signed(wire16)), wire10}}))
            begin
              reg41 <= $signed({(~&((reg30 && reg23) ?
                      ((8'ha8) - (8'haf)) : {reg41})),
                  $signed($unsigned((reg22 ? reg36 : reg43)))});
              reg42 <= (reg23 ?
                  {reg22[(2'h2):(1'h1)],
                      $signed(($unsigned(reg37) >>> (&reg30)))} : reg19);
              reg43 <= (~^reg40);
              reg44 <= {(~wire12), $unsigned((8'ha5))};
            end
          else
            begin
              reg41 <= $unsigned((~|{(-(wire15 >> (7'h41))),
                  (^$unsigned((8'hbe)))}));
              reg42 <= wire15;
              reg43 <= $signed({wire14[(4'h9):(3'h4)]});
              reg44 <= (|reg33);
              reg45 <= $unsigned((-$unsigned((~|wire11[(3'h5):(2'h3)]))));
            end
        end
    end
  assign wire46 = (reg43 ?
                      (^~$unsigned({reg28[(4'h8):(2'h3)]})) : $unsigned($unsigned({$unsigned(wire24)})));
  assign wire47 = $unsigned($unsigned({(~(wire24 ? reg45 : reg21))}));
  assign wire48 = reg26[(3'h6):(1'h1)];
  assign wire49 = reg38[(1'h1):(1'h1)];
  assign wire50 = (-$unsigned(reg19[(4'hc):(2'h3)]));
  assign wire51 = ((wire18 >> $unsigned($signed($signed((7'h40))))) != (^({$signed((8'hbd)),
                      $signed(wire18)} * wire25)));
endmodule
