module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire59;
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire23,
                 wire24,
                 wire59,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire4 = wire0[(4'hd):(3'h4)];
  assign wire5 = ((wire1[(2'h2):(1'h1)] <<< wire1) != ((^wire0) ?
                     $unsigned(wire4) : $signed($signed($unsigned(wire4)))));
  assign wire6 = wire5[(2'h2):(2'h2)];
  assign wire7 = wire1;
  assign wire8 = ((-(wire0[(1'h1):(1'h1)] << $signed(wire1))) * (~|$unsigned(wire5)));
  assign wire9 = $signed((^wire6[(4'hc):(2'h2)]));
  assign wire10 = {wire4};
  assign wire11 = ({wire6[(4'ha):(4'h8)],
                      (wire9[(4'ha):(2'h2)] + ($unsigned(wire9) | (wire0 ?
                          wire8 : wire4)))} + $unsigned(wire2[(2'h2):(1'h1)]));
  assign wire12 = ((wire4[(4'h9):(3'h4)] << wire7) < (($unsigned(wire3[(3'h7):(3'h6)]) > ($unsigned(wire5) | (wire10 & (8'hbd)))) << ($unsigned(wire5) ?
                      wire2 : $signed({wire7, wire9}))));
  assign wire13 = $signed($signed((wire6 && wire4)));
  always
    @(posedge clk) begin
      if ($signed(((|(^(^~wire8))) <<< wire4)))
        begin
          reg14 <= (wire6 ?
              ($signed((~|{wire5, wire2})) ?
                  {wire13[(3'h6):(3'h5)]} : wire8[(5'h10):(5'h10)]) : {$signed($signed($unsigned(wire5))),
                  (((wire2 ? wire7 : wire8) ^ (&wire6)) ?
                      (~&{wire0}) : wire0[(3'h7):(3'h5)])});
          if ($signed((~^(+wire4[(4'h9):(4'h8)]))))
            begin
              reg15 <= (wire0 ?
                  ((($unsigned(wire8) ? (wire0 >= wire8) : $unsigned(wire10)) ?
                          {wire11[(4'ha):(2'h3)],
                              wire7} : $unsigned($signed(wire0))) ?
                      ((^wire4[(1'h0):(1'h0)]) ~^ wire11[(3'h4):(1'h0)]) : wire0[(5'h12):(1'h0)]) : wire10);
            end
          else
            begin
              reg15 <= $signed(($signed({((8'ha1) == wire4)}) ?
                  wire12 : $unsigned(((wire8 - (8'hbb)) && ((8'ha4) ?
                      wire5 : wire2)))));
              reg16 <= $unsigned($signed(wire9[(3'h5):(2'h2)]));
              reg17 <= (((^((8'hb4) ?
                  wire2 : (reg14 ? wire0 : (8'hb8)))) || (wire6 ?
                  (wire1[(3'h6):(1'h1)] ?
                      reg16[(3'h6):(3'h6)] : wire10) : reg15)) + wire4);
              reg18 <= reg14;
            end
          if ({($signed(((+(8'hbe)) ? (^~(7'h42)) : wire6)) ?
                  wire9 : $signed($signed(wire0[(5'h12):(3'h4)])))})
            begin
              reg19 <= $unsigned(((8'ha7) ^~ $signed(reg14[(4'hf):(4'hb)])));
              reg20 <= (~|(wire9[(3'h7):(2'h3)] ?
                  (~|$unsigned((8'hbe))) : (&((wire1 != (8'hbd)) ?
                      (8'h9c) : wire1))));
            end
          else
            begin
              reg19 <= wire9[(1'h1):(1'h1)];
            end
          reg21 <= ($signed(($unsigned(((8'hb0) - reg18)) ?
              ($signed((8'hb4)) <= wire0[(5'h13):(2'h2)]) : ($unsigned(wire2) ?
                  (8'hb9) : (^~wire13)))) <= wire4);
        end
      else
        begin
          reg14 <= reg18;
          reg15 <= $unsigned((!((-{reg20}) <= (-reg18))));
          reg16 <= wire10[(2'h3):(2'h3)];
        end
      reg22 <= (^~{((8'ha5) <= (reg17[(3'h7):(1'h1)] ~^ wire2)),
          $signed($unsigned($signed((8'ha4))))});
    end
  assign wire23 = $signed($unsigned((^~{$unsigned(wire9), wire9})));
  assign wire24 = wire0;
  module25 #() modinst60 (wire59, clk, wire3, wire13, wire2, reg17, reg14);
  always
    @(posedge clk) begin
      reg61 <= $signed((reg15[(3'h5):(2'h2)] + wire12));
      reg62 <= reg14;
      reg63 <= ($signed($signed(((~wire2) != {(8'ha8),
          reg17}))) >> $unsigned((($unsigned(reg14) ?
              $signed((8'hb1)) : (wire0 <<< (7'h41))) ?
          ($unsigned(wire23) >= reg22[(3'h5):(3'h4)]) : (8'hba))));
      reg64 <= (~|(|($signed($unsigned(wire1)) ?
          wire0[(5'h10):(4'hd)] : wire12[(4'h9):(2'h3)])));
      reg65 <= ((reg15 || reg64[(3'h6):(1'h1)]) ?
          (~|{(wire12 ? {reg64, wire9} : wire8[(4'hc):(3'h7)]),
              {(|wire10)}}) : $unsigned((({wire7, wire3} ?
                  (reg18 & wire12) : (!(8'hbc))) ?
              ($unsigned(wire4) ?
                  reg14 : (reg61 <= wire9)) : ($signed(reg63) >>> (&(7'h43))))));
    end
endmodule

module module25
#(parameter param57 = (((~^(((8'h9f) ? (8'hbe) : (8'hb8)) + {(8'haf)})) ^ (~^((~|(8'ha1)) ? ((8'hb5) ? (8'hae) : (8'h9e)) : ((8'hb7) >= (8'ha6))))) ? (~^((|((8'hb6) > (8'h9f))) <<< ((+(8'haf)) <<< ((8'hb9) ~^ (7'h40))))) : ((~|(((8'ha3) ~^ (8'ha3)) ? ((8'h9e) ? (8'hbc) : (8'hbb)) : ((8'hbe) >= (8'ha0)))) ? (((~^(7'h44)) ? (&(7'h40)) : {(8'haf), (8'hbc)}) ^ (((8'hb3) ^ (8'hab)) >> {(8'hb2), (7'h43)})) : (8'hbc))), 
parameter param58 = (({param57, (&(!param57))} ? ({param57, param57} ? param57 : {{param57, param57}, {(8'hbf), param57}}) : ((~&((8'ha2) ? (8'ha1) : param57)) ? (~(8'hb1)) : ({param57, param57} - param57))) >>> (param57 ? (|(param57 ? (param57 ? param57 : param57) : param57)) : (((param57 <= param57) > (param57 ? param57 : (7'h42))) >= {(param57 <= (8'hb6))}))))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire51;
  assign y = {wire56, wire55, wire54, wire53, wire51, (1'h0)};
  module31 #() modinst52 (.wire34(wire26), .y(wire51), .wire33(wire30), .clk(clk), .wire35(wire27), .wire32(wire28));
  assign wire53 = (wire26 ?
                      (wire29 & wire30) : ((((wire30 * wire26) ?
                              (wire51 ?
                                  wire30 : wire27) : wire51[(3'h4):(1'h1)]) > wire26[(4'h8):(1'h1)]) ?
                          {$unsigned($unsigned(wire30))} : (((^(8'hba)) ?
                                  wire26 : {wire29}) ?
                              wire30 : (8'ha0))));
  assign wire54 = wire26[(1'h1):(1'h1)];
  assign wire55 = ($signed({(~^$unsigned(wire53))}) & {$unsigned($unsigned(wire53[(2'h3):(1'h0)]))});
  assign wire56 = wire55;
endmodule

module module31
#(parameter param49 = (((|(8'hb7)) >> ((((8'ha6) >>> (8'h9c)) ? {(8'hae), (8'ha7)} : ((8'hb5) ? (8'hbd) : (8'hbc))) > (^~{(8'hba)}))) ^~ (^~((((8'hb8) ? (7'h43) : (8'ha6)) ? ((8'hac) ? (7'h42) : (8'hac)) : ((7'h40) ? (7'h41) : (7'h44))) == (~^(~&(8'hbc)))))), 
parameter param50 = param49)
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire35;
  input wire signed [(4'hc):(1'h0)] wire34;
  input wire signed [(2'h2):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire38,
                 wire37,
                 wire36,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire36 = $unsigned((wire35[(3'h4):(3'h4)] ?
                      $unsigned({$signed(wire33),
                          {(8'hb3), wire33}}) : $unsigned(({wire35} ?
                          (~^wire34) : wire32[(3'h4):(3'h4)]))));
  assign wire37 = (~wire34);
  assign wire38 = ({(wire32[(1'h1):(1'h1)] ^ ($unsigned(wire35) >> wire37)),
                          $unsigned((-(wire34 >>> (8'hb8))))} ?
                      $unsigned((~&(8'hba))) : wire33);
  always
    @(posedge clk) begin
      reg39 <= ((|(~(+(wire34 ? wire35 : (8'ha2))))) | (wire37 ?
          wire36 : wire38[(3'h7):(3'h5)]));
      reg40 <= wire35;
    end
  assign wire41 = $signed((wire34[(3'h4):(2'h3)] ?
                      ((wire34[(4'h8):(3'h4)] >>> wire33) ?
                          {$unsigned(wire35)} : (-(wire35 != wire38))) : (^((wire38 >> wire32) - wire35))));
  assign wire42 = $unsigned(wire33);
  assign wire43 = (~&(+((&$unsigned(wire33)) ? (~&$signed(wire34)) : wire35)));
  assign wire44 = wire38;
  always
    @(posedge clk) begin
      reg45 <= (+{(|(wire37 ? ((8'hb2) & wire35) : (wire44 ? wire41 : wire42))),
          {wire42}});
      reg46 <= (~|(!(&(~&(wire38 >= wire33)))));
      reg47 <= ((&(^((8'hb8) ? (wire42 ? wire38 : wire38) : $signed(wire44)))) ?
          (8'h9e) : wire43);
      reg48 <= {($signed(wire34[(4'ha):(1'h0)]) != ((~wire32[(5'h10):(3'h4)]) ?
              {(|wire33), (reg47 - wire38)} : $signed({wire44}))),
          wire35};
    end
endmodule
