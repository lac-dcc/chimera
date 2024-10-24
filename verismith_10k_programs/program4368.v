module top
#(parameter param38 = (((~|{((8'ha6) ? (8'h9c) : (8'h9f)), ((8'hb9) == (8'hb8))}) ? (~(8'hb1)) : {(^((8'hb6) ? (8'hac) : (8'h9d)))}) ? ((~|{(~|(8'hbf))}) ? (!((~|(8'hac)) ? {(7'h41), (7'h40)} : {(8'hb0), (8'hb3)})) : {(~&((8'ha6) ? (8'hbb) : (8'ha1))), (((8'hb7) ? (8'hbf) : (8'ha0)) | ((8'hb9) ? (7'h43) : (8'had)))}) : ((((^(7'h41)) ? ((8'hbe) ? (8'ha4) : (8'hbb)) : {(8'ha3), (8'ha0)}) ? (((8'ha5) <<< (8'hb3)) * ((8'hb1) <<< (8'hab))) : {{(8'ha2)}, (|(8'h9f))}) ? ({((8'hbc) ? (8'hbd) : (8'h9d))} != (((8'ha5) >= (8'ha6)) ? ((7'h42) ? (8'hbe) : (8'hb3)) : ((8'hb7) ? (8'hb9) : (7'h41)))) : ({((8'hbd) ? (8'ha5) : (8'haa))} >> ({(8'hb4)} + ((8'hb9) ? (8'hb6) : (8'h9d)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  assign y = {wire37,
                 wire19,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
  assign wire5 = $unsigned(wire3);
  assign wire6 = $unsigned((wire4 ?
                     (!wire4[(3'h6):(3'h6)]) : ((wire3 * (wire1 ?
                             wire5 : wire2)) ?
                         $unsigned($signed(wire0)) : (wire4 ?
                             $signed(wire0) : (8'ha7)))));
  assign wire7 = $signed((+$signed(wire4[(2'h3):(1'h0)])));
  assign wire8 = ({$signed(wire7), $unsigned((~&wire6[(1'h0):(1'h0)]))} ?
                     wire3 : (wire6 <= (^({wire2, wire4} > (+wire5)))));
  assign wire9 = $unsigned($unsigned(wire3));
  always
    @(posedge clk) begin
      reg10 <= $unsigned(wire7);
      reg11 <= ((|((wire3[(4'hb):(4'h9)] ?
                  (wire9 ? wire3 : wire7) : $signed((8'ha2))) ?
              (wire0 * $unsigned(wire5)) : (~|wire1))) ?
          {($signed(wire7) ?
                  wire6[(1'h0):(1'h0)] : (wire8[(4'h9):(1'h0)] ?
                      (wire0 == wire5) : (+wire0)))} : {reg10, wire7});
      reg12 <= $signed(wire8[(4'hd):(3'h6)]);
      reg13 <= ($signed($unsigned($unsigned($signed(wire9)))) ?
          $unsigned((~|(&wire4))) : ($unsigned($unsigned($unsigned(wire6))) ?
              (&$unsigned(wire0[(2'h3):(2'h3)])) : (($unsigned(wire6) ?
                  (wire4 + reg10) : $signed(reg10)) > (-((8'ha6) ?
                  reg12 : wire1)))));
      if ($unsigned($signed($signed((!$signed(reg11))))))
        begin
          reg14 <= $signed((^~({(reg12 || wire3)} ?
              reg11 : (+(reg11 ? wire8 : reg13)))));
          reg15 <= reg11;
        end
      else
        begin
          reg14 <= (8'hb5);
        end
    end
  always
    @(posedge clk) begin
      reg16 <= {((|wire5) - (!reg13[(4'ha):(4'ha)])), {(7'h43)}};
      reg17 <= ($unsigned(((reg12[(4'h9):(4'h8)] >> wire7[(2'h3):(2'h2)]) + {wire5[(3'h6):(2'h3)],
              (reg16 ^ wire9)})) ?
          wire2[(1'h0):(1'h0)] : $signed($unsigned(($signed(wire3) >= (reg14 > wire2)))));
      reg18 <= $signed(wire9[(4'he):(3'h4)]);
    end
  assign wire19 = reg13[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg20 <= ({$unsigned(wire3)} == ($unsigned($unsigned($unsigned(reg12))) ?
          wire3[(2'h3):(1'h1)] : $signed((reg15[(4'hf):(3'h5)] ?
              (|wire9) : $signed(wire3)))));
      reg21 <= wire9[(4'hf):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg22 <= reg12;
      reg23 <= (reg12 ?
          $signed((&(wire7 ?
              (reg22 ?
                  wire3 : (7'h43)) : (!wire8)))) : $signed(($signed($unsigned(wire4)) <<< $signed({wire2}))));
      reg24 <= wire1;
      if (((^~$signed(wire8)) ? (~&$signed((-(^~wire3)))) : reg17))
        begin
          reg25 <= reg20[(4'hf):(3'h4)];
          reg26 <= reg11[(4'hc):(2'h3)];
          reg27 <= reg22;
          if ((wire0 || reg14[(2'h3):(1'h0)]))
            begin
              reg28 <= wire6;
              reg29 <= (~|(~$signed((~^$signed((7'h41))))));
            end
          else
            begin
              reg28 <= wire7;
              reg29 <= (^~($unsigned($signed($unsigned(wire8))) ?
                  ((^wire5[(4'he):(4'h9)]) | $unsigned((reg13 ?
                      reg20 : wire1))) : reg25[(3'h5):(1'h0)]));
              reg30 <= (($signed({{reg11, (7'h41)}}) ?
                  (((|wire7) ? $signed((8'ha4)) : reg27) ?
                      reg28[(2'h3):(2'h3)] : (~(wire2 > wire3))) : (($signed(reg10) <= $unsigned(reg24)) || reg13)) >= wire19);
              reg31 <= wire3;
            end
        end
      else
        begin
          if (($unsigned(reg13[(4'hf):(4'h8)]) << $signed(wire4)))
            begin
              reg25 <= (wire1[(4'h8):(3'h7)] | $unsigned((((wire19 ?
                      wire9 : reg11) ?
                  {reg30} : wire2[(1'h1):(1'h1)]) != $signed($unsigned(wire5)))));
              reg26 <= ((+((~&(reg11 - reg22)) ?
                      ((reg11 ? wire4 : reg31) ?
                          (|reg10) : (^~wire4)) : $unsigned($unsigned(reg28)))) ?
                  ($unsigned(reg18[(4'h9):(3'h7)]) ?
                      ((reg14 && reg28) ?
                          ($signed((8'ha8)) ?
                              {reg13} : ((8'hb8) < reg30)) : (|(&reg14))) : reg24) : reg16[(4'h9):(2'h2)]);
              reg27 <= wire2;
              reg28 <= {(reg24[(2'h3):(1'h1)] ?
                      reg13[(3'h7):(3'h5)] : $signed((8'hb1))),
                  (((-reg17[(5'h10):(4'hc)]) != {$unsigned((8'hb8)),
                          (~^(8'hb5))}) ?
                      wire7[(2'h2):(1'h1)] : {reg15[(4'hc):(1'h1)]})};
            end
          else
            begin
              reg25 <= ((((8'hab) ?
                  {(wire1 ? reg16 : reg29), (!reg14)} : {(reg31 ?
                          reg15 : wire9)}) >> (-{reg21[(4'h8):(3'h6)],
                  {wire9, reg17}})) && {$signed(wire3[(3'h4):(2'h3)])});
              reg26 <= wire6[(1'h1):(1'h1)];
              reg27 <= wire2;
              reg28 <= reg20;
              reg29 <= (wire4 ?
                  ((8'hbf) ?
                      {$unsigned((8'hb9)),
                          $unsigned(reg16)} : {$unsigned((^~reg25))}) : reg23);
            end
          reg30 <= $signed({({(~|reg12), (reg21 != reg26)} ?
                  (((8'hbb) ? (8'hae) : (8'hb8)) ?
                      (!reg18) : (^reg29)) : $unsigned($signed(reg15))),
              reg18[(4'h8):(3'h6)]});
        end
      reg32 <= (!$unsigned($signed($unsigned($unsigned(reg29)))));
    end
  always
    @(posedge clk) begin
      reg33 <= $signed(($signed((8'hab)) ?
          reg29 : $unsigned({wire4[(4'h8):(3'h5)]})));
      if (reg32[(4'ha):(4'h9)])
        begin
          reg34 <= {((-reg31) ?
                  $signed(($unsigned(wire6) == {wire6})) : {((wire4 || reg23) ?
                          (^reg10) : (wire2 ? (7'h40) : (8'ha6))),
                      reg31[(4'ha):(2'h3)]})};
          reg35 <= reg34;
        end
      else
        begin
          reg34 <= reg24;
          reg35 <= $unsigned(reg21[(1'h0):(1'h0)]);
        end
      reg36 <= reg25;
    end
  assign wire37 = wire9;
endmodule
