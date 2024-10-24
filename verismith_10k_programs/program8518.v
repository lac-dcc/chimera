module top
#(parameter param42 = ((&((~((8'ha3) ? (7'h41) : (7'h41))) ? ({(8'hbd), (7'h42)} ? ((8'h9c) ? (8'hbb) : (8'ha7)) : {(8'hb8)}) : (~(!(8'hbc))))) ? ({(8'hb8)} + (({(8'hbd), (8'hbd)} ? (!(8'hbb)) : (8'ha7)) ? (+(~^(8'haa))) : ((8'ha2) + {(8'hb3), (8'ha0)}))) : (^~((~^(-(8'hb4))) ? ({(8'hba)} << (|(8'hb8))) : (&(8'hbf))))), 
parameter param43 = param42)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire41,
                 wire35,
                 wire33,
                 wire24,
                 wire23,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 (1'h0)};
  assign wire5 = (-$unsigned(((7'h41) ?
                     $unsigned((wire0 ?
                         (8'h9e) : (8'hae))) : ((|wire2) && {wire3, wire4}))));
  assign wire6 = ((wire4[(3'h6):(3'h6)] ~^ ($unsigned(wire1) ?
                     $unsigned((wire2 ?
                         wire0 : wire5)) : $unsigned((~&(8'hb2))))) - wire0);
  assign wire7 = ({$unsigned(wire3[(5'h14):(4'h9)])} || (wire1[(5'h11):(5'h11)] ?
                     $unsigned((!(wire0 ?
                         wire0 : wire5))) : (|$unsigned($signed(wire3)))));
  assign wire8 = wire3;
  assign wire9 = $unsigned({(8'haf)});
  assign wire10 = {$signed((^($unsigned(wire2) == (wire1 ? wire5 : wire5)))),
                      (-$unsigned($signed((^~wire8))))};
  assign wire11 = wire8[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg12 <= $signed((+((wire7[(1'h1):(1'h1)] + (8'hb8)) ?
          {$unsigned(wire1), $signed(wire6)} : $signed(wire10))));
      reg13 <= wire7;
      reg14 <= $unsigned(wire4[(3'h6):(2'h2)]);
      if ($signed(wire0))
        begin
          reg15 <= (~&$signed({reg14}));
        end
      else
        begin
          reg15 <= (~^(wire1[(4'he):(4'h8)] ^ wire10));
          reg16 <= wire4;
          reg17 <= (-(wire7 <<< reg15));
          reg18 <= $unsigned((|wire5));
          if ($signed(reg15))
            begin
              reg19 <= $signed((wire1[(2'h3):(2'h2)] < (+($unsigned(wire8) ?
                  $unsigned(reg12) : reg16))));
              reg20 <= $unsigned(((((wire1 ?
                      (8'hba) : (8'hb4)) == $signed(wire5)) | $signed(wire6[(2'h2):(1'h1)])) ?
                  $unsigned(reg18) : reg12));
              reg21 <= (+wire6[(1'h1):(1'h1)]);
              reg22 <= (8'h9c);
            end
          else
            begin
              reg19 <= ((~$signed(wire5)) > reg12[(4'hf):(2'h3)]);
              reg20 <= {wire3, (8'hb0)};
            end
        end
    end
  assign wire23 = $signed(wire4);
  assign wire24 = reg15;
  always
    @(posedge clk) begin
      reg25 <= $signed({reg22[(2'h2):(2'h2)]});
      if (($signed($unsigned(wire10)) ?
          {$signed((&{(8'ha6), reg13})), (8'ha7)} : wire0))
        begin
          reg26 <= (~|wire3);
          reg27 <= (reg20[(3'h5):(2'h2)] ?
              ($unsigned($signed($unsigned(reg22))) ?
                  reg19[(3'h6):(2'h2)] : ($signed($signed(wire24)) ?
                      ({(8'hb7)} & (reg20 ?
                          wire4 : wire11)) : {wire5[(1'h1):(1'h0)],
                          $unsigned(reg25)})) : {reg13});
          reg28 <= $signed({reg20[(3'h6):(1'h1)]});
          reg29 <= (wire9 < ($signed((!{wire2})) >>> wire5[(3'h5):(1'h0)]));
        end
      else
        begin
          reg26 <= reg29;
          reg27 <= ($signed(wire7) | ((+(((8'ha4) ? reg13 : (8'hb8)) ^ (reg22 ?
              reg22 : wire6))) <= wire8));
          reg28 <= $unsigned({(^~(+(wire11 ? wire0 : reg16)))});
        end
      reg30 <= wire10;
      reg31 <= reg19[(2'h2):(2'h2)];
      reg32 <= reg29[(2'h2):(2'h2)];
    end
  assign wire33 = reg19[(4'hc):(3'h6)];
  always
    @(posedge clk) begin
      reg34 <= wire10[(4'hc):(4'ha)];
    end
  assign wire35 = wire11;
  always
    @(posedge clk) begin
      reg36 <= reg31;
      reg37 <= ($unsigned($unsigned($signed({wire24,
          wire6}))) ~^ $unsigned(((8'hb7) ?
          $unsigned(wire10[(1'h1):(1'h0)]) : reg25[(3'h7):(2'h2)])));
      reg38 <= $signed({(reg28[(4'hf):(4'h8)] > reg13)});
      reg39 <= (^~$signed(((~^wire6[(2'h3):(1'h0)]) ?
          $signed($signed(reg32)) : ($signed(reg27) & (reg21 ?
              reg29 : reg18)))));
      reg40 <= wire6[(2'h2):(1'h0)];
    end
  assign wire41 = $unsigned($unsigned($unsigned($unsigned((reg20 >> (7'h43))))));
endmodule
