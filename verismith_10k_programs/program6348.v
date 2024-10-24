module top
#(parameter param51 = {(({((8'hb5) || (8'had)), ((8'hb1) ? (8'hb2) : (8'ha1))} ? (+{(8'ha8)}) : (((8'ha6) >> (8'ha5)) >= {(8'hb7)})) ? (&(((8'hbb) - (8'hb6)) <<< {(8'hbc), (8'hac)})) : (^~((&(8'hb7)) ? ((8'hbd) ? (8'hb6) : (8'hb2)) : ((8'hb0) ? (7'h42) : (7'h43))))), (((((8'hb3) ~^ (7'h41)) ? {(7'h40), (8'had)} : {(8'ha6)}) * {(-(8'h9c)), (~(8'ha0))}) && ((^{(8'had), (8'hba)}) ? (((8'hba) + (8'hb3)) ? (~&(7'h43)) : ((8'hb3) - (8'hbb))) : {((8'hb5) >>> (8'hb7))}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire27;
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  assign y = {wire50,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 reg49,
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
                 (1'h0)};
  module4 #() modinst28 (wire27, clk, wire0, wire1, wire3, wire2);
  assign wire29 = (+wire1[(2'h2):(1'h0)]);
  assign wire30 = (^(wire1[(3'h7):(2'h2)] == wire29[(3'h4):(2'h2)]));
  assign wire31 = $signed(wire3);
  always
    @(posedge clk) begin
      reg32 <= $unsigned(wire1);
      if ((!$unsigned(($signed($signed(reg32)) > reg32[(4'ha):(3'h4)]))))
        begin
          if ($unsigned(wire1[(5'h12):(3'h4)]))
            begin
              reg33 <= (8'hb8);
              reg34 <= (&wire27);
              reg35 <= wire29[(2'h3):(2'h2)];
              reg36 <= $signed((|$signed(wire0[(3'h5):(1'h0)])));
            end
          else
            begin
              reg33 <= $signed($unsigned(((((7'h40) ? (8'ha1) : (8'hbb)) ?
                  reg32 : (^(8'hb9))) && wire3[(4'hb):(4'h9)])));
            end
          if ((~|reg32))
            begin
              reg37 <= wire1[(3'h7):(1'h1)];
              reg38 <= (~wire31[(3'h6):(1'h0)]);
              reg39 <= ($signed($signed({(reg36 == reg34),
                      $unsigned(wire30)})) ?
                  (wire1 ^ ((wire30 ?
                      $signed(wire0) : wire30[(2'h2):(2'h2)]) ~^ (wire31 >>> reg36[(3'h5):(3'h5)]))) : (~^wire0));
              reg40 <= $unsigned((|$unsigned(((8'hb4) ~^ $signed(reg35)))));
              reg41 <= wire0;
            end
          else
            begin
              reg37 <= (((8'h9c) ?
                  $signed(reg36[(4'he):(1'h1)]) : $signed((~|reg39[(2'h3):(1'h0)]))) || ($signed(((^reg35) ?
                  $unsigned(wire3) : wire31[(4'ha):(4'h8)])) & (!$signed(reg36[(2'h3):(1'h0)]))));
              reg38 <= (^~(~|(8'ha0)));
              reg39 <= $signed(wire27);
              reg40 <= {((!(~wire30)) >= wire1[(2'h2):(1'h1)])};
              reg41 <= (~&$signed(((~&reg37) ?
                  reg35 : $signed($signed(reg34)))));
            end
          if (wire1)
            begin
              reg42 <= ((8'hb9) ?
                  ($signed($unsigned($signed(reg35))) <<< $signed(reg38[(1'h0):(1'h0)])) : wire2[(4'hf):(4'hf)]);
              reg43 <= (((|((wire29 ?
                      (8'hb2) : wire1) - reg38)) & $unsigned((!$unsigned(reg37)))) ?
                  ((-reg32) ? wire3 : reg32) : (reg38 ?
                      ({(reg36 >>> reg34), {(8'hbf)}} * ((^~reg36) ?
                          $signed((8'hbf)) : reg33)) : $unsigned($signed(reg41[(2'h3):(1'h1)]))));
              reg44 <= {$unsigned(reg33), $signed({$signed((!reg35))})};
            end
          else
            begin
              reg42 <= (8'hb6);
              reg43 <= reg41;
              reg44 <= $signed({((^~(~&wire2)) >> wire29)});
            end
          reg45 <= $unsigned({(8'hb5)});
        end
      else
        begin
          if ($signed($signed($unsigned($signed((reg37 ? reg37 : reg44))))))
            begin
              reg33 <= {reg36[(4'ha):(4'h8)]};
              reg34 <= $unsigned(wire31[(4'h9):(3'h5)]);
              reg35 <= wire0[(4'h8):(2'h3)];
            end
          else
            begin
              reg33 <= (!$signed(($unsigned($unsigned(reg37)) ?
                  $signed((^~reg38)) : (wire30[(3'h5):(2'h2)] ?
                      reg44 : (^~reg33)))));
              reg34 <= ($signed($signed(reg39)) != ((reg44[(1'h0):(1'h0)] ^ wire30) || $signed(wire31)));
            end
          reg36 <= (8'hb5);
        end
    end
  always
    @(posedge clk) begin
      reg46 <= reg39[(3'h6):(1'h1)];
      reg47 <= $unsigned($unsigned($signed({$signed(wire1)})));
      reg48 <= (8'hbe);
      reg49 <= reg35;
    end
  assign wire50 = reg45[(4'ha):(1'h0)];
endmodule

module module4
#(parameter param26 = (((({(8'ha7)} ^ ((8'ha5) ? (8'hb7) : (8'ha4))) ? (~&(!(8'hbd))) : (((8'ha9) ? (8'hb3) : (8'ha9)) ? ((8'ha8) ~^ (8'h9c)) : ((8'h9c) ? (8'h9e) : (8'h9e)))) ? ((~^((8'hac) >>> (8'h9d))) ? (&(~(8'ha8))) : (8'h9f)) : ((~^((8'ha2) == (7'h40))) << (((8'ha0) ? (8'hbb) : (8'hb4)) >= ((8'hac) <<< (8'hb1))))) <= ((((|(8'haf)) >>> ((8'h9e) & (8'hb5))) ? (-((8'h9f) ~^ (8'hb8))) : (&((8'hac) ? (8'hbb) : (8'ha4)))) - ((~|(|(8'hb4))) ? (~^((8'hbd) - (8'had))) : (((7'h43) ? (8'hae) : (8'hb1)) & ((8'haa) != (8'ha9)))))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire9;
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire9,
                 reg21,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire9 = (&(wire8 ^ (8'ha6)));
  always
    @(posedge clk) begin
      reg10 <= wire8[(4'h8):(2'h2)];
      reg11 <= $unsigned($unsigned(wire9[(1'h1):(1'h1)]));
      reg12 <= {wire6[(3'h7):(3'h4)]};
      reg13 <= wire6;
      reg14 <= (wire7 ?
          $unsigned(($signed((wire6 ? wire6 : wire7)) <= $unsigned({reg10,
              reg11}))) : $signed({(~&{wire7, wire9})}));
    end
  assign wire15 = $signed(wire7[(4'he):(4'h9)]);
  assign wire16 = (-wire8[(3'h4):(3'h4)]);
  assign wire17 = (~^((!(~&(wire7 ? wire6 : wire5))) ^~ wire9[(1'h0):(1'h0)]));
  assign wire18 = {$signed(wire6[(4'hb):(2'h3)])};
  assign wire19 = (((wire17 ? reg14 : $signed($signed(wire8))) ?
                          {wire18[(1'h1):(1'h1)],
                              {(reg11 ? reg10 : wire6),
                                  ((8'hb8) ?
                                      wire18 : reg12)}} : $signed($signed((|(8'ha5))))) ?
                      wire17 : (wire5 ?
                          (wire7[(3'h5):(1'h0)] ?
                              ({wire17, wire18} ?
                                  $signed(wire7) : (wire15 ?
                                      wire17 : (8'haf))) : (8'hb4)) : ($unsigned((wire18 | reg13)) ?
                              reg13 : ((~^wire8) ?
                                  (reg12 ? (7'h41) : wire6) : (~|wire9)))));
  assign wire20 = wire15;
  always
    @(posedge clk) begin
      reg21 <= reg13[(4'h8):(3'h4)];
    end
  assign wire22 = $signed($signed((|wire19)));
  assign wire23 = (~(~&(((wire18 <<< reg13) >>> {wire5, reg11}) ?
                      ($signed(wire19) || $signed(reg12)) : $signed(wire6[(4'he):(1'h0)]))));
  assign wire24 = $signed(reg14);
  assign wire25 = wire16[(3'h5):(3'h5)];
endmodule
