module top
#(parameter param50 = (-({(~^((8'ha9) ? (8'ha3) : (8'hb4)))} ? ((~{(8'hae)}) >>> (^~((8'h9f) ? (8'hb2) : (8'hb4)))) : (&(~|((8'haa) ? (8'h9d) : (8'h9f)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire40;
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 (1'h0)};
  module5 #() modinst41 (.wire9(wire3), .wire6(wire4), .y(wire40), .clk(clk), .wire8(wire0), .wire7(wire2));
  assign wire42 = {wire0, wire40[(3'h5):(1'h0)]};
  assign wire43 = (8'hb8);
  assign wire44 = $unsigned(($signed($signed($signed((8'hb6)))) < wire2[(2'h2):(1'h0)]));
  assign wire45 = $signed(((+(wire3 <= {wire1})) ?
                      $signed(({(8'haf)} < (wire44 - wire40))) : (+(^((7'h44) ?
                          wire43 : wire40)))));
  assign wire46 = $signed({(^wire40[(3'h4):(3'h4)]),
                      $unsigned($signed((-wire42)))});
  assign wire47 = $signed(wire40[(2'h2):(1'h1)]);
  assign wire48 = $signed(((wire46 | wire46[(3'h4):(2'h2)]) ?
                      (wire40 <<< (!wire46)) : wire44[(3'h4):(3'h4)]));
  assign wire49 = ($unsigned($signed(((wire1 ? (8'hb2) : wire40) <= {wire46,
                      wire44}))) && $unsigned($unsigned((wire47[(4'h8):(3'h4)] >>> (-wire0)))));
endmodule

module module5
#(parameter param38 = (((+(~&{(8'hb5), (8'hbe)})) ^~ ({((8'hb3) ? (8'haa) : (8'hb7))} >> (((8'haf) ? (8'hb4) : (8'hbd)) == ((8'ha5) ? (8'ha3) : (8'h9e))))) ? {((|(!(8'hb9))) ? {{(8'h9c), (8'hbc)}} : ((~&(8'ha5)) ? {(7'h44)} : (~(8'ha6))))} : {(8'ha8)}), 
parameter param39 = param38)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire20,
                 wire19,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
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
  always
    @(posedge clk) begin
      if (wire7[(2'h3):(1'h1)])
        begin
          reg10 <= wire9;
        end
      else
        begin
          reg10 <= (&{$unsigned(wire8[(2'h2):(1'h0)]),
              ($unsigned($signed((7'h44))) + (&$signed(wire9)))});
          reg11 <= wire9;
        end
      reg12 <= $unsigned($unsigned((8'hbf)));
      if (($unsigned((wire6 ?
              $unsigned(reg12[(4'hb):(3'h7)]) : reg11[(3'h4):(2'h3)])) ?
          (reg12[(5'h11):(4'hc)] * reg10) : wire6))
        begin
          reg13 <= (($signed((-(^~reg12))) >= (8'haf)) ?
              reg12[(5'h12):(4'hf)] : (^~{$unsigned((^reg11)),
                  $signed($unsigned(wire6))}));
        end
      else
        begin
          if ((($unsigned((|reg12)) == (^~(reg12[(3'h7):(2'h3)] ?
              (~|wire8) : (~(8'ha7))))) >= ($unsigned(($signed(reg13) << (reg11 <= reg11))) ^~ $unsigned(((-reg12) && (-reg10))))))
            begin
              reg13 <= wire9;
              reg14 <= (+$unsigned($signed(wire6)));
              reg15 <= ($unsigned(reg14) || {$unsigned(($signed(reg12) ?
                      (wire6 ? reg13 : reg12) : reg12)),
                  reg13[(1'h0):(1'h0)]});
              reg16 <= (((((reg12 ? (8'ha7) : reg14) ?
                      (reg14 ^ (8'ha2)) : $unsigned(reg11)) == $unsigned(((8'ha0) <= wire6))) ?
                  $unsigned(($signed(reg14) <<< (wire6 ?
                      wire7 : (8'ha8)))) : (((reg13 & reg11) ?
                      wire6[(4'ha):(4'h8)] : (~&wire6)) <<< {{reg15, wire8},
                      $signed((8'h9d))})) >>> (~^reg13[(3'h4):(2'h3)]));
            end
          else
            begin
              reg13 <= $signed($unsigned(wire8));
            end
          if (wire8[(1'h1):(1'h0)])
            begin
              reg17 <= wire8;
            end
          else
            begin
              reg17 <= (reg13[(3'h4):(2'h3)] & reg16[(4'hc):(1'h0)]);
            end
          reg18 <= ($unsigned(wire6) ^~ reg15);
        end
    end
  assign wire19 = ({$signed(($unsigned(wire9) >>> wire9)), (&reg12)} ?
                      ((~|reg12) != wire7[(4'hc):(3'h7)]) : $unsigned(($signed(reg14[(1'h0):(1'h0)]) & ((reg18 ?
                              wire8 : wire7) ?
                          wire7[(2'h3):(2'h3)] : ((7'h44) >>> reg10)))));
  assign wire20 = (($unsigned(($signed(reg11) << {reg14, reg14})) && wire7) ?
                      ((($unsigned(reg10) || {reg17, wire7}) ?
                          $signed((reg14 | wire9)) : wire9[(4'he):(4'h9)]) << reg14) : wire9[(4'hd):(1'h0)]);
  always
    @(posedge clk) begin
      if ((^wire20[(1'h1):(1'h1)]))
        begin
          reg21 <= reg17[(1'h0):(1'h0)];
          reg22 <= reg17[(4'ha):(3'h6)];
          reg23 <= wire20;
        end
      else
        begin
          reg21 <= $unsigned((($unsigned(reg11[(4'hd):(4'h9)]) ?
              (+$unsigned(reg11)) : wire8[(3'h5):(3'h4)]) * (($signed(wire8) ?
              {reg17, (8'hba)} : {reg22, reg15}) * reg23[(4'h8):(3'h7)])));
          reg22 <= reg23;
        end
    end
  always
    @(posedge clk) begin
      reg24 <= (-wire8);
      if (reg18[(1'h1):(1'h1)])
        begin
          if (reg23)
            begin
              reg25 <= (~(7'h41));
              reg26 <= (wire7[(3'h7):(1'h0)] ?
                  ((reg15 >= (8'hb5)) ~^ (8'hb9)) : $signed({((wire8 ?
                          reg11 : reg14) || wire8),
                      reg13}));
              reg27 <= {$signed((&(~^reg10[(3'h6):(1'h0)]))), reg13};
              reg28 <= $signed(((((reg11 << reg14) ?
                  (reg13 < reg23) : $signed((8'haa))) <= $signed((8'ha1))) && ($signed((reg10 * wire6)) ?
                  wire6[(3'h4):(1'h0)] : reg27)));
              reg29 <= reg15[(1'h0):(1'h0)];
            end
          else
            begin
              reg25 <= (reg21 >> ((reg26 - ((wire20 ? reg27 : wire7) ?
                      (-reg23) : (8'h9f))) ?
                  reg21 : reg28[(3'h4):(1'h1)]));
              reg26 <= reg12[(2'h3):(2'h2)];
              reg27 <= {(+$signed({(reg24 ? reg22 : (8'hae))}))};
              reg28 <= {((reg25[(3'h6):(3'h5)] >> $signed($unsigned(reg14))) || $unsigned((^reg12))),
                  (($unsigned(wire20) ?
                          $signed($unsigned(wire7)) : ($unsigned((8'hb0)) && $unsigned((8'ha3)))) ?
                      $signed(((reg10 ? reg17 : reg18) ?
                          reg25[(3'h7):(1'h1)] : (reg12 ?
                              (8'h9d) : wire20))) : $signed({$signed(reg21)}))};
            end
          reg30 <= ((~&($signed({(8'hba), reg25}) <= (+(8'ha1)))) ?
              (reg18 ?
                  reg24[(3'h7):(1'h1)] : $unsigned((8'haf))) : ((~^(reg13[(1'h1):(1'h1)] ?
                  (7'h42) : reg17[(3'h6):(1'h1)])) != wire20[(4'h9):(1'h1)]));
        end
      else
        begin
          reg25 <= wire19[(3'h6):(3'h4)];
          reg26 <= $unsigned({(reg17 || $unsigned(reg27[(2'h2):(1'h0)]))});
          reg27 <= $signed({reg13[(4'h8):(3'h7)]});
        end
    end
  assign wire31 = reg30;
  assign wire32 = reg16;
  assign wire33 = (~&reg23[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      reg34 <= (8'ha0);
      reg35 <= reg12;
      reg36 <= ($signed((-($signed(reg14) ?
              $unsigned((8'hbc)) : reg17[(1'h0):(1'h0)]))) ?
          $unsigned(reg14) : wire7);
      reg37 <= $unsigned((&reg36));
    end
endmodule
