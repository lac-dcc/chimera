module top
#(parameter param38 = ((((((7'h44) ? (7'h41) : (8'hb2)) ? ((8'hb3) >>> (8'hb6)) : (8'h9f)) + (-{(8'haa)})) ? ((((8'hbf) || (8'hbf)) ^~ ((8'hbe) ? (8'hbf) : (8'had))) ? {((8'hae) && (8'hb6)), (&(8'hb9))} : (~(^~(8'ha1)))) : (8'hac)) ^ (!((^~((8'hbf) == (8'hbb))) >= {(^~(8'hbf))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $unsigned({$unsigned((^~wire4[(2'h2):(1'h0)])),
                     $unsigned({((8'hb7) > wire1)})});
  assign wire6 = $unsigned((8'h9f));
  always
    @(posedge clk) begin
      reg7 <= (!wire0);
      reg8 <= wire6;
      reg9 <= ($signed({((wire3 ?
              wire4 : wire6) >> $unsigned(wire3))}) * ({(^wire4)} ?
          ($signed((wire0 ? wire5 : wire0)) ?
              wire2 : ($signed(wire6) ?
                  wire4 : {wire2})) : (!(wire3[(1'h0):(1'h0)] < (wire2 ?
              (8'had) : wire5)))));
      reg10 <= wire2[(4'hf):(4'ha)];
    end
  assign wire11 = $unsigned((wire3[(1'h1):(1'h1)] ?
                      (reg10[(4'hb):(3'h7)] ?
                          (reg7 ?
                              (wire1 ?
                                  wire0 : reg8) : wire5) : (wire5[(3'h5):(3'h4)] ?
                              $signed(reg9) : $signed(reg9))) : $unsigned($signed(wire5[(4'ha):(4'h9)]))));
  assign wire12 = (wire5[(1'h0):(1'h0)] ?
                      ((wire11 ?
                          ((~|reg8) * (reg9 > (8'hb5))) : (wire2[(5'h12):(5'h11)] * (~wire4))) && wire6[(2'h2):(1'h1)]) : (8'hb0));
  assign wire13 = ((~|(((wire0 ? reg9 : wire2) && $unsigned(wire6)) ?
                      $unsigned(reg7) : (reg9[(1'h0):(1'h0)] ^ (&reg8)))) >= (wire3[(2'h2):(2'h2)] ?
                      $signed((wire4[(4'hb):(3'h4)] ?
                          $signed(wire12) : (^wire11))) : {((reg10 ?
                                  (8'hbe) : wire11) ?
                              $signed(reg10) : (|wire1)),
                          {$signed(wire4)}}));
  always
    @(posedge clk) begin
      reg14 <= reg7[(3'h6):(1'h1)];
      reg15 <= (8'hbe);
      if (reg14)
        begin
          reg16 <= ((|$unsigned(((wire4 ? reg14 : reg8) >= (reg8 == wire5)))) ?
              {(reg10 <= reg15[(1'h0):(1'h0)])} : {$signed(((reg9 ?
                          reg7 : wire4) ?
                      reg9 : wire5[(3'h6):(3'h6)]))});
          reg17 <= (8'hb4);
        end
      else
        begin
          if (reg7[(5'h13):(1'h1)])
            begin
              reg16 <= {wire6[(1'h1):(1'h0)], wire13};
              reg17 <= ((~reg9[(2'h3):(2'h2)]) ^ wire2);
              reg18 <= $unsigned((~^wire1[(3'h5):(2'h3)]));
              reg19 <= $unsigned((!$unsigned($signed($unsigned(wire5)))));
            end
          else
            begin
              reg16 <= {(~^($signed((^~reg19)) << ((|wire3) | $signed(wire1))))};
              reg17 <= ($unsigned((&$unsigned(reg15[(4'h8):(3'h4)]))) ?
                  {((-(8'ha9)) ?
                          (~|(wire13 ? wire3 : wire3)) : ((reg7 ?
                                  (8'hb4) : (8'ha3)) ?
                              {(7'h42), wire6} : (!wire13))),
                      $unsigned(({reg8, wire13} ?
                          {reg14} : (reg9 ?
                              reg8 : wire13)))} : $signed(wire12));
            end
          reg20 <= reg16[(2'h3):(2'h2)];
          if (wire4)
            begin
              reg21 <= reg19[(2'h3):(1'h1)];
            end
          else
            begin
              reg21 <= reg10[(4'h8):(3'h4)];
              reg22 <= wire1[(4'h8):(2'h2)];
            end
        end
      if (wire4)
        begin
          reg23 <= $signed($unsigned(($unsigned($unsigned(wire11)) && reg7)));
          reg24 <= $unsigned(wire13);
          reg25 <= ($signed((-((-(8'hbb)) || reg17[(3'h4):(3'h4)]))) ?
              ($signed(wire5[(4'hc):(3'h7)]) ?
                  (!{(|wire2)}) : (wire0[(3'h7):(1'h1)] ?
                      $unsigned(wire3[(1'h1):(1'h0)]) : ((~|reg22) == reg8[(3'h4):(3'h4)]))) : reg23);
          if ((^~$signed(wire0[(4'he):(3'h4)])))
            begin
              reg26 <= {(~$unsigned(((-(8'haa)) > wire11[(3'h5):(1'h0)])))};
              reg27 <= {$unsigned($unsigned(($signed(reg25) + $unsigned(wire11))))};
              reg28 <= $unsigned(reg8[(3'h5):(1'h1)]);
              reg29 <= (~&($unsigned({wire5,
                  (^~(8'hae))}) < (reg17 << reg7[(5'h12):(1'h0)])));
            end
          else
            begin
              reg26 <= (+(reg23 ?
                  ($signed((^reg17)) > ($unsigned(reg18) ?
                      (8'had) : $signed((8'ha9)))) : ((+reg23) ?
                      reg18[(1'h1):(1'h0)] : (~^(7'h43)))));
              reg27 <= reg15[(2'h2):(1'h1)];
              reg28 <= {reg20[(3'h4):(1'h0)]};
              reg29 <= (&wire11);
            end
        end
      else
        begin
          if (({$signed($signed((~reg9)))} ?
              reg23 : {(($unsigned((8'hbc)) * (8'hb7)) ?
                      $signed((8'ha9)) : ($unsigned(wire1) >> $unsigned((8'hb9))))}))
            begin
              reg23 <= (reg17[(2'h2):(1'h0)] ?
                  reg25[(3'h6):(3'h6)] : ((^wire12) || (((reg26 ?
                      wire4 : (8'ha7)) | {reg22, reg26}) >= wire0)));
              reg24 <= (&$signed((+$signed($unsigned(reg10)))));
            end
          else
            begin
              reg23 <= {((^$signed((reg23 && wire12))) - $unsigned($signed((+(8'hae))))),
                  ((wire11[(4'ha):(4'h9)] ?
                          $unsigned(wire2[(1'h1):(1'h0)]) : $unsigned(reg25[(2'h3):(2'h2)])) ?
                      wire0 : $unsigned((8'had)))};
              reg24 <= $signed({$unsigned((~&{(8'hbb), wire3}))});
              reg25 <= $unsigned((~|reg23[(4'h8):(3'h5)]));
              reg26 <= $unsigned(reg22[(3'h4):(1'h1)]);
              reg27 <= reg22[(3'h4):(1'h1)];
            end
          if (wire12)
            begin
              reg28 <= ($unsigned(wire1[(2'h3):(2'h3)]) ?
                  reg8 : {((&(reg16 ~^ (8'ha9))) >>> (7'h41)),
                      {({reg22, (8'ha3)} | (-reg9))}});
              reg29 <= (&(&reg19[(4'ha):(1'h1)]));
              reg30 <= reg15;
              reg31 <= $signed($unsigned({(8'ha9)}));
              reg32 <= (&reg29[(5'h12):(4'h8)]);
            end
          else
            begin
              reg28 <= $unsigned($unsigned(($unsigned((|wire6)) ?
                  (|(|wire0)) : ($unsigned(reg16) <= (^reg22)))));
              reg29 <= ((&reg15[(4'ha):(4'h8)]) >= (~^(~^({reg10, wire6} ?
                  (~|wire6) : $unsigned(reg24)))));
            end
        end
      reg33 <= reg10;
    end
  assign wire34 = $unsigned((reg18[(4'hc):(4'hc)] ?
                      $signed({(~wire3), (reg8 ? wire5 : reg10)}) : reg19));
  assign wire35 = ($unsigned(reg28[(4'ha):(1'h0)]) + reg25[(3'h5):(3'h4)]);
  assign wire36 = (-reg22);
  assign wire37 = (~&(!(+{wire6, $unsigned(reg29)})));
endmodule
