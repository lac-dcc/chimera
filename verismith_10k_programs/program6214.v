module top
#(parameter param33 = (((-(((8'haa) != (8'hba)) | ((7'h44) ? (8'h9e) : (8'ha2)))) ? (^((!(8'h9d)) ? {(8'ha2)} : ((8'hb8) ? (7'h43) : (8'hb1)))) : (~^(((8'hbe) ? (8'hba) : (8'hb6)) ~^ ((8'ha4) ? (7'h40) : (8'ha8))))) ? {({(+(7'h41))} < (~|(8'hbc)))} : (({{(7'h43)}} <<< (~^(!(8'hbb)))) ? {{(&(8'hb7)), ((8'hb1) ? (8'hbc) : (7'h41))}, (((8'hb0) * (8'hb9)) ? (~^(8'hbc)) : (~^(8'ha5)))} : ((((8'hb0) ? (8'hae) : (8'ha0)) ? ((8'ha4) && (8'hbb)) : ((8'hbd) ? (8'h9c) : (8'ha7))) >>> {((8'ha5) ? (7'h42) : (8'hbb)), (~^(8'ha9))}))), 
parameter param34 = param33)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed((&(~|(((7'h44) ? wire4 : wire1) ?
                     $signed((8'ha6)) : (~wire1)))));
  assign wire6 = ((wire0[(3'h5):(1'h1)] ?
                     wire2[(2'h3):(1'h0)] : wire4) >> $unsigned(($unsigned(((8'ha2) <<< (8'hb1))) <= $unsigned(wire1))));
  assign wire7 = ($unsigned((|$signed($signed(wire2)))) ?
                     $unsigned(wire1[(3'h4):(1'h0)]) : ($unsigned($unsigned({wire0})) ?
                         (((wire6 ~^ wire0) >>> wire3[(2'h3):(2'h2)]) >>> ((wire0 - wire4) ^~ (~&wire4))) : ($signed((wire1 + wire2)) > (&(wire5 ?
                             wire0 : (7'h44))))));
  assign wire8 = $unsigned((wire5 - $signed(wire0)));
  always
    @(posedge clk) begin
      if ({$signed(wire0)})
        begin
          reg9 <= wire7[(3'h4):(1'h0)];
          reg10 <= (wire8[(4'hb):(4'ha)] ^ wire5[(4'hd):(3'h4)]);
          reg11 <= ((wire7[(2'h2):(1'h0)] ?
              $unsigned($signed($unsigned(wire1))) : ($unsigned((8'ha6)) ?
                  wire5[(4'hb):(3'h5)] : wire7)) && $signed((wire7 + $unsigned((wire3 != wire8)))));
          if (reg9)
            begin
              reg12 <= (reg9 ?
                  (((!(-reg9)) ?
                          $signed({wire8, wire0}) : $signed((wire7 ?
                              wire3 : wire3))) ?
                      $unsigned($unsigned($unsigned((8'hae)))) : $signed(wire3)) : wire7[(3'h7):(2'h2)]);
              reg13 <= ((((~&{reg11}) + (wire4[(2'h2):(2'h2)] ?
                      wire7[(1'h1):(1'h0)] : (~reg11))) ?
                  ((~(reg12 ? reg12 : wire4)) ?
                      wire3[(2'h3):(1'h1)] : $signed(wire7[(2'h3):(2'h3)])) : wire2[(4'h9):(1'h1)]) >> ($signed(wire6) ?
                  wire2 : (|reg10[(3'h6):(3'h5)])));
              reg14 <= ($unsigned(wire4[(1'h0):(1'h0)]) ?
                  (8'ha5) : ($unsigned(reg12[(2'h3):(1'h0)]) ?
                      $unsigned(reg9) : (!(reg9[(2'h2):(2'h2)] - (8'hb0)))));
              reg15 <= wire3;
              reg16 <= (~(8'hbd));
            end
          else
            begin
              reg12 <= (&$signed($unsigned(((&wire8) ~^ (~&reg9)))));
              reg13 <= ($unsigned(reg13) ? $signed(wire3) : reg11);
              reg14 <= (reg10 - ((((~|reg12) ?
                  $unsigned(wire0) : $signed((8'hb1))) && (&wire1[(1'h0):(1'h0)])) & (((wire1 < (8'hae)) <= $unsigned(wire0)) ?
                  (&(!wire1)) : $unsigned((reg12 ? reg11 : (7'h42))))));
              reg15 <= $unsigned({$signed(reg12)});
            end
          reg17 <= (^~($signed($signed(((8'h9e) ? (8'hb1) : (8'hbe)))) ?
              ($signed((^wire2)) >= ({(8'hb1),
                  wire5} < ((7'h44) ^~ wire4))) : {(&{wire4})}));
        end
      else
        begin
          reg9 <= wire7[(3'h6):(3'h6)];
        end
      if ($unsigned(wire2[(3'h6):(3'h5)]))
        begin
          reg18 <= ($unsigned((&(~|(reg16 == reg14)))) || (wire3 ?
              wire5 : (^$signed((^~reg12)))));
          if (reg13[(1'h1):(1'h0)])
            begin
              reg19 <= $signed((reg16[(2'h2):(1'h0)] | (8'hbe)));
            end
          else
            begin
              reg19 <= reg11[(4'he):(1'h1)];
              reg20 <= $signed(reg15[(5'h13):(4'hd)]);
            end
          reg21 <= reg12[(2'h3):(2'h3)];
        end
      else
        begin
          if (wire1[(2'h2):(2'h2)])
            begin
              reg18 <= (reg13[(1'h0):(1'h0)] >>> reg11);
              reg19 <= $signed(reg10);
            end
          else
            begin
              reg18 <= (-($unsigned((!(8'ha2))) >> (((~|reg9) <= (wire0 ?
                      reg11 : wire6)) ?
                  $unsigned((^reg21)) : ($unsigned((8'hbc)) <<< (!wire0)))));
              reg19 <= $unsigned((+(({wire2} ^ {reg19, reg13}) ?
                  $unsigned((^(8'hbe))) : (-(wire8 ? reg12 : (8'hb1))))));
            end
          reg20 <= $signed(reg18[(4'h9):(2'h3)]);
          reg21 <= $unsigned($unsigned($unsigned(reg12[(2'h2):(1'h1)])));
        end
      reg22 <= (|reg18[(3'h7):(3'h7)]);
      if (wire4)
        begin
          reg23 <= (|$signed(reg14[(4'hb):(4'hb)]));
          reg24 <= $signed((7'h40));
        end
      else
        begin
          reg23 <= ((wire5 ^~ reg10[(3'h5):(2'h3)]) ?
              $unsigned(($signed((reg19 + reg14)) ?
                  $signed($unsigned((8'haf))) : (~(~^reg10)))) : (~reg12[(1'h0):(1'h0)]));
          if (($unsigned($unsigned((&{reg18}))) ?
              reg15 : ({$unsigned($signed(reg10))} ?
                  ((!(+reg20)) | {(wire7 < reg21)}) : (reg9 ?
                      (8'hbe) : $unsigned($unsigned(wire5))))))
            begin
              reg24 <= ((!reg21[(4'h9):(3'h6)]) ? {reg15, (~&(8'hac))} : reg23);
              reg25 <= ($signed($signed({(reg11 ? wire1 : (8'hbb)),
                      reg19[(4'hb):(3'h6)]})) ?
                  ((^~$signed($signed(reg15))) ?
                      ($unsigned((reg17 ^~ reg15)) == ($signed(reg22) << reg15)) : $signed($unsigned(reg16))) : $signed((8'hbd)));
              reg26 <= $signed(reg20[(1'h1):(1'h0)]);
            end
          else
            begin
              reg24 <= {((reg17 && ($unsigned(reg11) ?
                          $signed(reg19) : reg13)) ?
                      reg26 : reg14)};
              reg25 <= $unsigned($unsigned({($unsigned(reg16) >>> $signed(wire8))}));
            end
          if ((~|($unsigned(reg23) ?
              ($unsigned(wire6) || $unsigned((wire7 - reg18))) : (({reg12} >>> {reg21,
                      (8'ha0)}) ?
                  $unsigned((wire4 << (8'ha7))) : (~^{reg18})))))
            begin
              reg27 <= reg15[(5'h12):(2'h3)];
              reg28 <= (^~$signed($signed({(~|wire7), $signed((8'ha8))})));
              reg29 <= ($signed(reg11) ?
                  $signed(reg18[(3'h6):(3'h6)]) : $unsigned(wire3));
            end
          else
            begin
              reg27 <= {reg27,
                  (+(($signed(wire2) ?
                      reg25[(5'h12):(2'h2)] : reg20) ^~ (|reg23)))};
              reg28 <= (~|$unsigned((!{{reg27}})));
              reg29 <= {$signed(($signed(wire3[(3'h7):(2'h3)]) ?
                      (~(wire6 ? reg19 : (8'hbc))) : ($unsigned(reg11) ?
                          reg28 : (reg15 <= wire3)))),
                  {reg26[(1'h0):(1'h0)]}};
            end
          reg30 <= wire3[(1'h1):(1'h1)];
        end
    end
  assign wire31 = $unsigned(reg24);
  assign wire32 = {$signed(((~$unsigned(reg21)) * $signed(((7'h41) ?
                          reg12 : wire1)))),
                      reg26[(3'h4):(1'h1)]};
endmodule
