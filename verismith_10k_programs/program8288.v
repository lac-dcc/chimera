module top
#(parameter param58 = ((((~^(^~(8'hbe))) <<< (((7'h40) << (8'hbe)) ? ((8'h9f) ? (8'ha3) : (8'hbc)) : (&(8'hba)))) >= (((^~(8'ha6)) == (&(8'hb8))) ? ((&(8'ha3)) ? {(8'ha0)} : (&(8'hb5))) : (((8'hb7) - (8'h9f)) ? ((8'hb7) ? (7'h43) : (8'h9f)) : (8'hbb)))) - (^~((~|{(7'h40), (8'hbb)}) * ((^~(8'ha4)) ? ((8'haf) <<< (8'hae)) : (~(7'h43)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire19;
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire39,
                 wire38,
                 wire21,
                 wire19,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  module4 #() modinst20 (wire19, clk, wire1, wire0, wire2, wire3, (8'hbc));
  assign wire21 = (8'hb9);
  always
    @(posedge clk) begin
      if ((wire2[(2'h2):(1'h0)] ?
          wire1[(4'h8):(2'h2)] : {((8'haa) <<< (-(8'hbe))),
              $unsigned(((wire3 == wire19) || $unsigned((8'ha3))))}))
        begin
          reg22 <= ((wire3 <<< wire1[(5'h11):(4'hd)]) - $unsigned((-$unsigned(wire21[(2'h2):(1'h0)]))));
        end
      else
        begin
          if (($unsigned({wire0[(3'h7):(1'h0)],
              ($unsigned(reg22) ?
                  (~&wire2) : (wire3 ?
                      wire21 : wire2))}) >> $unsigned((|wire19[(4'hb):(4'ha)]))))
            begin
              reg22 <= (wire1 >>> wire0[(4'h8):(4'h8)]);
            end
          else
            begin
              reg22 <= (($unsigned(($signed(wire2) << $unsigned(wire2))) * wire19) ?
                  wire21 : ((-$unsigned({wire21,
                      (8'hbb)})) >= ({$signed(wire2)} + (wire2[(1'h0):(1'h0)] ?
                      wire3 : $signed(wire0)))));
              reg23 <= wire0;
              reg24 <= $signed(reg22[(3'h5):(2'h3)]);
              reg25 <= (wire19[(4'ha):(3'h4)] ?
                  wire0[(4'ha):(2'h2)] : ((^((wire19 < wire3) + $unsigned((7'h40)))) != wire2[(4'hb):(4'h9)]));
              reg26 <= ((($signed((+reg24)) ?
                      wire3[(1'h0):(1'h0)] : (^~(reg25 << reg23))) >= $unsigned(wire3)) ?
                  $signed(wire1[(5'h10):(4'hd)]) : $signed((&wire21)));
            end
          if ({$signed($unsigned(reg22[(3'h4):(2'h2)]))})
            begin
              reg27 <= wire3;
              reg28 <= $unsigned(wire1);
              reg29 <= reg23[(3'h4):(2'h2)];
            end
          else
            begin
              reg27 <= ($unsigned((reg29[(2'h3):(1'h1)] <<< wire2[(5'h10):(3'h4)])) ^ $unsigned(reg23[(3'h4):(3'h4)]));
            end
          if ($unsigned(($signed((reg28[(3'h4):(1'h1)] ?
                  reg25[(4'he):(1'h0)] : (8'hbd))) ?
              (8'ha3) : (~({reg25} ?
                  $signed(wire1) : (wire21 ? wire19 : reg22))))))
            begin
              reg30 <= (wire19 != (^reg28[(1'h1):(1'h0)]));
              reg31 <= ($signed(reg24[(4'ha):(4'h9)]) ?
                  (^~$unsigned(((7'h41) >>> $signed(reg25)))) : reg24[(4'ha):(4'ha)]);
            end
          else
            begin
              reg30 <= $unsigned(wire1);
            end
          reg32 <= reg25;
          reg33 <= $signed($unsigned($unsigned(reg30[(1'h0):(1'h0)])));
        end
      if ($signed(wire21[(2'h3):(1'h0)]))
        begin
          reg34 <= {(reg22[(2'h3):(1'h1)] ? reg33 : (~reg32[(4'h9):(3'h7)])),
              wire21[(4'h8):(1'h0)]};
        end
      else
        begin
          reg34 <= {$unsigned($signed(reg32))};
        end
      reg35 <= (wire3[(3'h7):(1'h0)] ?
          $unsigned($unsigned($unsigned(((8'hbb) >>> reg25)))) : {(($unsigned(reg33) ?
                      reg25 : wire19[(4'he):(4'hb)]) ?
                  wire0[(1'h1):(1'h1)] : (reg27[(1'h1):(1'h0)] ^ (8'hb4)))});
      reg36 <= ({(reg29 >= $unsigned((^~reg24)))} ?
          (^{reg25[(4'hd):(3'h7)], {wire21, $unsigned(reg23)}}) : wire19);
      reg37 <= {(reg26[(2'h3):(2'h3)] ?
              (^~{$signed(reg36)}) : ((8'ha5) ?
                  ($unsigned((8'hb9)) ?
                      $unsigned(reg30) : reg33[(4'hf):(2'h3)]) : $unsigned((wire19 ?
                      wire21 : reg33)))),
          $unsigned((8'ha3))};
    end
  assign wire38 = $signed(reg34);
  assign wire39 = (reg30 ^ ({reg30[(1'h1):(1'h1)], {reg26}} ?
                      wire1 : $signed($unsigned((+reg23)))));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg40 <= reg36;
          reg41 <= reg33[(4'hd):(1'h1)];
        end
      else
        begin
          reg40 <= {(^~$unsigned($unsigned($signed(wire19)))),
              $signed(((reg23 ? reg23[(3'h6):(1'h0)] : wire21) ?
                  (~^$unsigned(reg33)) : $unsigned($unsigned(wire1))))};
          reg41 <= wire0[(1'h1):(1'h1)];
          if ($signed($unsigned($unsigned(($signed((7'h41)) ?
              $unsigned(wire3) : reg29[(3'h5):(2'h2)])))))
            begin
              reg42 <= ((($signed(reg22[(3'h5):(3'h4)]) >> reg25) ?
                      $unsigned($signed(wire0[(3'h6):(3'h5)])) : $signed($signed((reg33 * wire19)))) ?
                  $signed($signed($signed($unsigned(wire3)))) : $signed((((!reg29) ?
                          reg37 : {reg41, (7'h44)}) ?
                      {reg35[(4'h8):(3'h5)],
                          $unsigned(reg24)} : $signed({reg36}))));
              reg43 <= wire2[(4'hc):(2'h3)];
              reg44 <= reg30[(1'h1):(1'h0)];
            end
          else
            begin
              reg42 <= reg28[(1'h1):(1'h1)];
              reg43 <= (8'hbb);
              reg44 <= (~|wire39);
            end
          if (reg25)
            begin
              reg45 <= $signed($signed($signed($signed((wire38 ?
                  (8'ha1) : reg44)))));
              reg46 <= (($signed((-((8'hb6) ? (8'ha1) : wire3))) ?
                      reg41[(1'h1):(1'h0)] : (~(~|(reg40 ? reg44 : wire19)))) ?
                  wire3 : $signed({$unsigned((reg32 ^~ wire38)),
                      {(wire38 ? wire21 : reg37), (wire2 ? reg28 : reg32)}}));
            end
          else
            begin
              reg45 <= ((~|(reg26[(3'h6):(1'h0)] >> wire38[(3'h6):(1'h1)])) < ($unsigned(wire2[(4'h8):(1'h0)]) * $unsigned(reg24[(3'h6):(1'h0)])));
              reg46 <= $unsigned(reg28[(2'h2):(1'h1)]);
              reg47 <= ({(((reg29 ?
                          reg27 : (8'hae)) >= reg45[(1'h1):(1'h0)]) - reg30[(2'h2):(1'h0)])} ?
                  {$unsigned($unsigned($unsigned(reg42))),
                      ({$unsigned(reg30), reg22} ?
                          reg40[(2'h2):(1'h0)] : ($unsigned(reg45) ?
                              (reg44 ? reg44 : reg41) : {wire38,
                                  reg44}))} : ($signed(reg44[(3'h5):(1'h1)]) ?
                      (((reg34 ^~ (8'hac)) * reg24) <<< (8'ha7)) : (reg30 >= (+reg36))));
              reg48 <= (-$signed({$unsigned({reg23})}));
            end
        end
      reg49 <= (~&(+(~^wire38[(2'h3):(2'h3)])));
    end
  assign wire50 = (8'hbf);
  assign wire51 = ((7'h42) ?
                      (|(($unsigned((8'haa)) ?
                          reg49 : reg31[(1'h0):(1'h0)]) || (~^(-reg36)))) : $unsigned(wire50[(1'h1):(1'h0)]));
  assign wire52 = reg48[(4'hf):(3'h5)];
  assign wire53 = {reg40};
  assign wire54 = {{(reg34 ?
                              wire2 : ((reg43 <<< wire19) ?
                                  reg43[(4'hd):(4'hb)] : (~reg44)))},
                      reg28[(2'h3):(2'h2)]};
  assign wire55 = $signed($signed(($signed($unsigned(reg34)) ?
                      ((^wire53) && {reg28}) : {reg24[(4'h9):(4'h8)]})));
  assign wire56 = wire52;
  assign wire57 = (wire56 == (((-$signed(wire19)) ~^ reg29[(4'h8):(2'h3)]) ?
                      $signed(((+wire38) ?
                          wire51 : wire0[(4'h9):(4'h9)])) : ((reg24[(3'h5):(1'h1)] ?
                          (wire53 ?
                              reg42 : (8'hbf)) : ((7'h44) <<< reg49)) >>> (reg30[(2'h2):(1'h1)] && {reg32}))));
endmodule

module module4
#(parameter param17 = (8'had), 
parameter param18 = (~param17))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire6;
  input wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  assign y = {wire16, wire15, wire13, wire12, wire11, reg14, reg10, (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= (8'hac);
    end
  assign wire11 = $signed({wire7[(4'hd):(1'h0)]});
  assign wire12 = wire5;
  assign wire13 = ((~&wire5[(4'ha):(1'h1)]) ?
                      {wire7, wire11[(3'h5):(2'h2)]} : {wire7[(4'h8):(1'h0)]});
  always
    @(posedge clk) begin
      reg14 <= $unsigned((wire9[(1'h1):(1'h0)] ?
          ((wire11 ^ wire11) ?
              wire8[(3'h6):(3'h6)] : wire8) : $unsigned($signed((|wire8)))));
    end
  assign wire15 = {$signed($unsigned({wire6})), (+wire9[(1'h0):(1'h0)])};
  assign wire16 = $signed($unsigned($unsigned($signed(wire5[(3'h5):(1'h1)]))));
endmodule
