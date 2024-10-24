module top
#(parameter param53 = {(((~((8'ha6) ? (8'hbd) : (8'hbf))) ? {((7'h44) ? (8'h9f) : (8'hb4))} : ((~&(8'ha3)) ? {(8'ha0), (8'h9e)} : (~&(8'ha5)))) || (~|{{(8'hb8)}, ((8'h9f) ? (8'haa) : (8'hbb))}))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire51;
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire5, wire6, wire8, wire9, wire51, reg7, (1'h0)};
  assign wire5 = (-wire2[(3'h6):(3'h6)]);
  assign wire6 = ((8'had) > (((|(~&wire2)) & $unsigned((wire0 ^~ wire1))) ?
                     ($signed({(7'h43), wire3}) ?
                         wire5 : $unsigned(wire3[(1'h0):(1'h0)])) : wire5));
  always
    @(posedge clk) begin
      reg7 <= (wire5[(4'ha):(2'h2)] >>> ({{(|(8'h9d))}} || wire6[(3'h7):(3'h5)]));
    end
  assign wire8 = (+$signed(reg7[(4'hb):(2'h3)]));
  assign wire9 = ($signed($signed({wire5})) ?
                     wire3 : $unsigned($signed(($unsigned(reg7) << (wire2 << wire3)))));
  module10 #() modinst52 (.wire13(wire4), .y(wire51), .clk(clk), .wire11(wire5), .wire12(wire2), .wire14(wire6), .wire15(wire1));
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire31,
                 wire30,
                 wire17,
                 wire16,
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
                 (1'h0)};
  assign wire16 = (~&((~&(&(wire13 ^~ wire13))) | $signed(($unsigned(wire15) ?
                      (wire11 << (8'hb2)) : (~|wire12)))));
  assign wire17 = wire13[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg18 <= wire16[(1'h0):(1'h0)];
      if ((({wire11[(3'h6):(2'h3)],
          $signed($unsigned(wire16))} >= $signed((((8'hb9) ?
          wire11 : reg18) ^~ wire11[(4'h9):(2'h2)]))) | wire13))
        begin
          reg19 <= wire12[(3'h5):(2'h2)];
          reg20 <= ($signed(wire11) << wire11[(3'h7):(3'h7)]);
        end
      else
        begin
          reg19 <= $signed(wire14);
        end
      if (wire14[(4'hd):(4'h8)])
        begin
          reg21 <= (!wire17[(3'h6):(2'h2)]);
          reg22 <= $signed($unsigned(($signed(((8'hb5) || wire12)) ?
              (~|$unsigned(wire17)) : {(!wire16), $unsigned(wire11)})));
          if ((reg22[(3'h7):(1'h0)] ?
              reg19[(2'h3):(1'h1)] : $unsigned(($signed({wire14,
                  (8'hbb)}) <= reg19[(3'h7):(3'h4)]))))
            begin
              reg23 <= reg18;
              reg24 <= {reg20[(5'h10):(4'he)]};
              reg25 <= $unsigned(reg22[(3'h6):(3'h5)]);
            end
          else
            begin
              reg23 <= reg20[(2'h3):(1'h1)];
              reg24 <= ((&wire14[(3'h4):(3'h4)]) ?
                  $unsigned((reg21 + (wire16[(3'h4):(2'h3)] ?
                      (^~wire15) : {reg23}))) : reg20[(4'h8):(1'h0)]);
              reg25 <= wire11;
              reg26 <= $unsigned(wire15);
            end
        end
      else
        begin
          reg21 <= ($unsigned((($signed(reg25) ?
              (^~wire14) : (reg21 ? (8'h9c) : reg21)) >>> ((wire17 ?
                  reg23 : wire12) ?
              reg18[(3'h4):(3'h4)] : (reg26 ?
                  (8'hb9) : wire11)))) >> (({wire11} ?
              ((8'hb0) ?
                  (wire11 ?
                      wire14 : reg23) : (reg25 + reg25)) : {(~&reg24)}) >> $unsigned(reg20)));
          if ((((((wire12 ? reg21 : reg20) ?
                  (reg26 + wire13) : (^~reg21)) | {$signed(reg20),
                  wire15[(1'h1):(1'h0)]}) >> ($signed($unsigned(wire14)) == $signed(wire15))) ?
              wire16 : $unsigned($unsigned(($unsigned(reg26) ?
                  (wire17 ? (8'hb5) : reg23) : (wire14 ? wire15 : reg26))))))
            begin
              reg22 <= (+(^(reg24 | (-(+wire13)))));
              reg23 <= ((8'ha3) & $signed(wire15));
              reg24 <= {((~&{reg22[(4'h8):(1'h0)],
                      wire13[(4'h9):(1'h1)]}) < $unsigned(((wire14 ?
                      wire12 : reg23) == $signed(reg22)))),
                  reg19[(4'hb):(4'h9)]};
              reg25 <= $signed($unsigned(reg22));
            end
          else
            begin
              reg22 <= ($unsigned(reg26) <<< (~(|(8'had))));
              reg23 <= reg24;
              reg24 <= (reg25[(1'h0):(1'h0)] >>> reg22);
            end
          reg26 <= $signed((8'ha4));
          reg27 <= wire13[(2'h2):(2'h2)];
        end
      reg28 <= $signed(wire15[(1'h1):(1'h1)]);
      reg29 <= (~&($unsigned({reg25}) ?
          reg23 : ($signed({(8'hb4)}) ?
              reg20[(1'h1):(1'h1)] : $signed($signed((8'ha3))))));
    end
  assign wire30 = (reg24 >> reg18[(1'h1):(1'h1)]);
  assign wire31 = wire13;
  always
    @(posedge clk) begin
      reg32 <= $unsigned($unsigned($unsigned($signed((^~wire13)))));
      reg33 <= (8'hb6);
      if ($signed((($unsigned((wire13 * wire31)) * (-$unsigned(reg18))) >>> reg19)))
        begin
          reg34 <= (wire30[(1'h1):(1'h0)] - $unsigned((reg28[(3'h5):(3'h5)] ?
              $unsigned((wire13 && wire15)) : ({wire11, reg23} <<< reg27))));
          reg35 <= reg22[(3'h7):(2'h2)];
        end
      else
        begin
          if ((~&(((~&$unsigned(wire30)) <= $signed((!(8'hb9)))) <= $unsigned((~&$signed(reg20))))))
            begin
              reg34 <= wire16[(4'hc):(2'h2)];
            end
          else
            begin
              reg34 <= wire13;
              reg35 <= ($signed($unsigned(($signed(wire31) ^ (+reg22)))) >= $unsigned($signed($signed($signed(reg22)))));
            end
          reg36 <= ((reg21 < (|$unsigned((+(8'hbb))))) ?
              $signed($signed((reg35[(1'h1):(1'h0)] & wire16))) : (8'hb3));
          reg37 <= ((reg35[(2'h2):(1'h1)] ?
              (($unsigned(reg35) ?
                  (reg33 ^ wire30) : (reg35 <<< reg24)) && (reg27 - reg25[(4'hf):(1'h1)])) : $unsigned({wire31,
                  (8'h9f)})) != (reg21[(4'hc):(2'h3)] ?
              (~^wire17) : reg25[(2'h3):(1'h0)]));
          if ((reg22[(3'h7):(3'h7)] ? (~&reg36) : (~&wire17)))
            begin
              reg38 <= reg27[(5'h11):(4'ha)];
              reg39 <= {reg21[(3'h7):(3'h5)]};
              reg40 <= $signed($unsigned(($unsigned(reg19[(4'h8):(4'h8)]) == $signed({wire14}))));
              reg41 <= $unsigned(reg26[(4'hf):(4'h8)]);
              reg42 <= ((reg33 ?
                      {(8'ha2),
                          $signed(((8'ha1) ?
                              reg20 : (8'hae)))} : ($signed((reg26 ?
                          reg35 : (8'hb9))) >= reg19)) ?
                  reg26[(4'hb):(3'h4)] : $unsigned($unsigned($signed($unsigned(wire31)))));
            end
          else
            begin
              reg38 <= reg36[(5'h11):(5'h10)];
              reg39 <= reg40;
              reg40 <= wire11[(1'h0):(1'h0)];
              reg41 <= $unsigned(reg41);
            end
        end
      reg43 <= reg40[(1'h1):(1'h0)];
      if ((8'ha2))
        begin
          reg44 <= (~|(~^$signed($unsigned(reg28))));
        end
      else
        begin
          if ((^~($unsigned($signed(reg22[(5'h12):(3'h5)])) ?
              wire12 : {$unsigned(reg26)})))
            begin
              reg44 <= (+(|(^reg36)));
              reg45 <= ((reg23 ?
                  (^(reg34[(1'h0):(1'h0)] ?
                      reg38 : $unsigned(reg43))) : reg27[(5'h13):(3'h6)]) + reg25);
            end
          else
            begin
              reg44 <= ($unsigned(($signed($signed(reg42)) * $unsigned((~|wire15)))) ?
                  (-(8'hb7)) : $unsigned($signed((~(reg37 && wire17)))));
              reg45 <= (wire30[(2'h3):(1'h0)] ?
                  {reg45[(1'h0):(1'h0)]} : ($signed((~&$unsigned((8'h9d)))) < (-({reg18} || $signed(reg27)))));
              reg46 <= reg18[(1'h1):(1'h0)];
              reg47 <= $signed($unsigned(((wire17 ?
                  (!reg33) : reg33[(2'h3):(2'h2)]) != ($unsigned((8'h9c)) ?
                  (reg45 < (8'hb4)) : $unsigned(reg35)))));
              reg48 <= (+{((~|(8'hbd)) ? {reg47} : $signed({reg42, wire14})),
                  (^~{(wire16 ? wire31 : reg34)})});
            end
        end
    end
  assign wire49 = $unsigned(reg38[(2'h3):(2'h3)]);
  assign wire50 = (8'h9e);
endmodule
