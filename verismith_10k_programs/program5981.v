module top
#(parameter param37 = {(((|(^~(8'hbd))) ? (((8'hb3) < (7'h40)) ? {(8'hbb), (8'ha5)} : (~|(7'h42))) : (((8'h9f) ? (8'hb2) : (8'hb0)) | (-(7'h44)))) > (((~^(8'hb3)) ^ ((8'hb0) ? (7'h43) : (8'ha9))) ? (~&(~(8'hbf))) : (~^(|(8'hb1))))), (((8'hbb) ? ((&(7'h42)) == ((7'h40) ? (8'ha6) : (8'hbc))) : (-{(8'ha3), (8'ha0)})) ? (-(^(&(8'hb6)))) : {(((8'ha7) ? (8'ha4) : (8'hb3)) ? {(8'hb8)} : {(8'hb6), (7'h42)})})}, 
parameter param38 = param37)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire5,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg21,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ($signed((wire3[(2'h2):(1'h0)] ?
                     ((&wire4) ?
                         (|wire2) : wire1[(3'h5):(1'h0)]) : ((wire4 <<< (8'hbc)) ~^ $signed(wire3)))) ^ (({$signed(wire3),
                             $signed(wire3)} ?
                         $signed($unsigned(wire0)) : wire3[(2'h2):(1'h1)]) ?
                     ((-(wire4 ? wire1 : (8'ha0))) ?
                         wire4[(3'h6):(1'h0)] : $signed(wire3)) : ((~|$unsigned(wire4)) == {wire3[(3'h4):(1'h0)]})));
  always
    @(posedge clk) begin
      if (($signed((~(-{wire4, wire3}))) ?
          $unsigned($unsigned({$unsigned(wire1), ((8'hb1) << wire2)})) : wire3))
        begin
          reg6 <= $unsigned(wire3);
          reg7 <= (wire3 ?
              (+(~&$signed($signed(wire0)))) : $signed((&$unsigned(wire5[(2'h2):(2'h2)]))));
          reg8 <= $unsigned(wire5);
          reg9 <= wire2[(1'h1):(1'h0)];
          if (((~&(!((+reg9) ? ((8'h9d) ? wire1 : reg6) : (|wire2)))) ?
              {($signed($signed(reg9)) >>> $unsigned(reg8)),
                  $signed(reg8[(1'h1):(1'h0)])} : reg6[(4'hc):(3'h4)]))
            begin
              reg10 <= wire0[(1'h0):(1'h0)];
              reg11 <= reg9;
              reg12 <= $unsigned(wire0);
            end
          else
            begin
              reg10 <= ($unsigned(((^~reg10[(2'h2):(2'h2)]) != (8'hbc))) ?
                  (8'hb8) : $unsigned(($unsigned($unsigned(reg6)) ?
                      ((reg8 ? reg12 : wire0) | wire5[(3'h4):(1'h1)]) : ((reg8 ?
                          (8'hab) : (8'hb4)) & (-reg9)))));
            end
        end
      else
        begin
          if ((8'had))
            begin
              reg6 <= $unsigned((^reg6));
              reg7 <= (~wire0[(1'h0):(1'h0)]);
              reg8 <= $signed(($unsigned($signed($signed(wire2))) ^~ {$unsigned((wire3 >>> wire2)),
                  (!(reg9 ? wire3 : reg11))}));
              reg9 <= {(reg7 ?
                      $unsigned(reg9) : ($signed({reg9}) ~^ $signed({wire0}))),
                  reg11};
              reg10 <= $signed((reg6[(4'ha):(3'h6)] ? wire1 : (+reg10)));
            end
          else
            begin
              reg6 <= ({((~(wire3 - (8'ha6))) >> $unsigned(reg6)),
                  ({(reg6 ? reg8 : (8'h9e)), {reg12, reg8}} ?
                      (|(reg10 ? reg11 : (8'hac))) : {reg10,
                          reg8[(2'h3):(1'h1)]})} ^~ $signed($unsigned((wire5[(2'h3):(2'h3)] ?
                  $unsigned(reg9) : $signed(reg11)))));
            end
          if (reg9)
            begin
              reg11 <= (reg12[(2'h3):(1'h0)] ? reg8 : reg11);
              reg12 <= $unsigned(reg9);
              reg13 <= $signed($unsigned(((8'hb5) ^~ (~^reg12))));
            end
          else
            begin
              reg11 <= ({{reg12[(1'h1):(1'h1)]},
                  $unsigned(wire4[(2'h3):(2'h3)])} >= ((^(~(wire2 | (8'hbe)))) ?
                  wire5 : $unsigned(reg11[(4'hf):(4'hf)])));
            end
          reg14 <= (|$signed($signed($signed((&reg12)))));
          reg15 <= reg14[(4'hf):(4'hc)];
        end
      reg16 <= ((wire0[(1'h1):(1'h1)] ?
          {$signed(reg11[(1'h1):(1'h0)]),
              $signed($unsigned(wire2))} : (^($signed(reg14) == wire3[(3'h4):(2'h2)]))) || ($signed(wire4[(5'h11):(5'h10)]) <<< (reg13 + $signed(reg6[(5'h12):(5'h11)]))));
      reg17 <= (reg9 ? {$unsigned(wire3)} : (~$signed((&wire4))));
      reg18 <= (+(reg9[(4'ha):(1'h1)] ^ reg8));
      reg19 <= ((($unsigned(((8'hbc) <= wire3)) ?
          {{reg14}} : $signed(reg17[(4'hc):(3'h4)])) >= $signed({reg11[(4'hc):(4'hb)]})) | (reg10 ?
          {{$unsigned(reg17)}} : ($unsigned((8'ha2)) ?
              $unsigned((~&wire5)) : wire3)));
    end
  assign wire20 = reg11[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      reg21 <= $signed((|(reg11 || {reg7})));
    end
  assign wire22 = wire2[(5'h11):(5'h10)];
  assign wire23 = $signed({(8'hb3), wire1});
  assign wire24 = ((reg19[(4'hf):(3'h4)] - (~^wire23[(2'h3):(1'h0)])) | (&{$unsigned(wire1),
                      $signed((wire22 & reg18))}));
  assign wire25 = wire4[(4'hc):(3'h7)];
  assign wire26 = $unsigned(reg7[(4'h8):(3'h5)]);
  assign wire27 = reg10[(4'hb):(3'h5)];
  assign wire28 = $unsigned($signed(wire1));
  assign wire29 = $unsigned(($unsigned((+$signed(wire22))) ?
                      ($signed(reg8) ?
                          (|$signed(wire26)) : reg14) : $unsigned(reg15)));
  always
    @(posedge clk) begin
      reg30 <= ({{($signed(wire27) ? (wire26 >> wire24) : (~^(8'ha3))),
                  $unsigned($unsigned(reg7))}} ?
          wire29[(3'h6):(3'h4)] : ($unsigned((reg9[(2'h3):(2'h2)] && ((8'hbf) == reg13))) * $unsigned(($signed(wire27) ?
              {(8'hba)} : $unsigned(wire2)))));
      reg31 <= wire20;
      reg32 <= ((8'hba) <<< ($unsigned(($signed(wire22) << (~wire29))) ?
          $unsigned($signed((reg13 ?
              (8'hae) : (8'hbb)))) : $signed($signed(reg11))));
      reg33 <= (8'hb6);
    end
  assign wire34 = $signed($signed(reg18));
  assign wire35 = ($signed(reg11[(4'hd):(1'h1)]) ?
                      ((^~((reg10 <<< reg33) ?
                          {wire22} : (reg7 < wire0))) << wire34) : {$unsigned($signed($unsigned(wire34))),
                          reg8[(1'h0):(1'h0)]});
  assign wire36 = $unsigned(($unsigned(reg7[(4'h9):(3'h7)]) << ($signed((reg8 >>> wire0)) ?
                      ((!wire35) ^ wire20[(2'h3):(2'h3)]) : $unsigned((-wire5)))));
endmodule
