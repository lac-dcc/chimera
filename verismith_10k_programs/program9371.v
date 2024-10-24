module top
#(parameter param67 = (~^((((-(8'hab)) >> (~(8'ha8))) == ({(8'h9d), (8'h9c)} << ((8'hb8) ? (8'hb6) : (8'ha1)))) ~^ ({((8'hb9) ? (7'h40) : (7'h43)), ((8'hb8) << (8'ha2))} == (~(8'hbd))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire64;
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  assign y = {wire66,
                 wire41,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire64,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (^~wire4);
      reg6 <= reg5;
    end
  always
    @(posedge clk) begin
      reg7 <= wire0[(4'hd):(4'h9)];
      reg8 <= reg6[(3'h5):(1'h1)];
      if ($signed($unsigned($signed((~^wire2)))))
        begin
          reg9 <= {wire2};
          reg10 <= wire0;
        end
      else
        begin
          reg9 <= $signed((wire1[(4'ha):(1'h0)] == wire0));
          reg10 <= (((((|reg7) + (^~(8'hb4))) ?
                  wire0[(4'h9):(3'h4)] : reg6[(4'hf):(4'h9)]) ?
              $signed(({reg10} & (~^wire3))) : {$unsigned(((8'h9c) ?
                      reg7 : reg5))}) ^ (reg8[(2'h3):(2'h3)] ^ wire0));
        end
    end
  assign wire11 = $unsigned(reg9[(3'h6):(1'h0)]);
  assign wire12 = {reg5};
  assign wire13 = (^~$signed(wire11[(4'h9):(2'h2)]));
  assign wire14 = $signed(wire3[(4'ha):(4'h9)]);
  module15 #() modinst42 (wire41, clk, reg5, wire12, wire4, wire11, reg7);
  assign wire43 = (8'hb2);
  assign wire44 = wire1[(2'h2):(1'h1)];
  assign wire45 = (8'ha6);
  assign wire46 = {$signed(wire43[(1'h0):(1'h0)])};
  assign wire47 = ((~&{wire12,
                      $signed((8'ha0))}) ~^ $signed({({wire46} * $signed((8'hbf))),
                      ((reg9 ? (8'hb8) : wire41) ?
                          $unsigned(reg7) : (wire43 ? (8'hbf) : wire41))}));
  assign wire48 = ($signed((|wire4)) != $signed($signed(wire3[(3'h7):(3'h7)])));
  assign wire49 = $unsigned(wire41[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      reg50 <= wire12[(4'hb):(4'hb)];
    end
  module51 #() modinst65 (.y(wire64), .wire55(wire2), .wire53(wire13), .wire54(reg6), .clk(clk), .wire52(wire48));
  assign wire66 = $signed($unsigned($signed($unsigned({(8'hbd), wire11}))));
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire55;
  input wire [(4'hb):(1'h0)] wire54;
  input wire [(3'h6):(1'h0)] wire53;
  input wire signed [(4'he):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 (1'h0)};
  assign wire56 = wire53[(3'h4):(1'h0)];
  assign wire57 = ((~&{($unsigned(wire56) ?
                              $signed(wire56) : wire54[(4'ha):(4'ha)])}) ?
                      ($unsigned(wire52[(4'ha):(1'h0)]) ?
                          $signed(wire56[(4'hb):(3'h7)]) : wire53[(3'h6):(1'h0)]) : {(($signed(wire56) + {wire54,
                              wire53}) ^ ((wire53 ? wire54 : wire53) ?
                              $signed((7'h43)) : $signed(wire53))),
                          wire55});
  assign wire58 = ($unsigned((|{$unsigned((8'hae))})) ?
                      ((wire55 != wire55[(4'h9):(4'h9)]) ?
                          (^~((~&wire53) > $unsigned(wire57))) : wire52) : wire57);
  assign wire59 = wire52;
  assign wire60 = ($signed((&(|wire57))) == ((($signed(wire53) ?
                          $unsigned(wire53) : $unsigned(wire53)) ?
                      wire58[(3'h7):(3'h4)] : $signed($signed(wire58))) && ($signed(wire59) ?
                      ($unsigned(wire58) ?
                          $signed(wire54) : (wire59 ?
                              wire57 : wire52)) : {wire54})));
  assign wire61 = (8'hb3);
  assign wire62 = ((wire52[(3'h4):(2'h3)] ?
                      wire60[(3'h7):(3'h6)] : $signed(wire61[(3'h4):(1'h1)])) ^~ {$unsigned(wire55[(4'h8):(3'h6)])});
  assign wire63 = {wire61};
endmodule

module module15
#(parameter param39 = {(((((8'ha9) << (8'ha8)) > ((8'ha9) ? (8'ha1) : (8'hb1))) ? (((8'hbd) & (8'ha0)) == (7'h44)) : ({(8'h9c)} >> {(8'ha0)})) == ({(~&(8'ha4))} >> {{(8'ha0), (7'h41)}})), ((^(-{(8'ha8), (7'h44)})) >> (8'had))}, 
parameter param40 = (({param39, ({param39, param39} != (param39 ? param39 : param39))} ? param39 : (({param39} && (8'hb8)) - ((+param39) ? ((8'hbd) ? param39 : param39) : (|param39)))) && ({((~&param39) ~^ (param39 ? param39 : param39))} - param39)))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire signed [(2'h3):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire34,
                 wire33,
                 wire22,
                 wire21,
                 reg38,
                 reg35,
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
                 (1'h0)};
  assign wire21 = (^~wire16[(1'h1):(1'h1)]);
  assign wire22 = ($unsigned(wire19) ?
                      (({wire20} == (((8'h9e) < wire16) ?
                          (wire16 | wire21) : (-wire18))) | (wire19 > wire21[(1'h1):(1'h1)])) : (($unsigned((wire20 & wire18)) ^~ ((&wire16) ?
                          (wire18 * (8'hb9)) : {(8'hb7)})) ^~ wire21));
  always
    @(posedge clk) begin
      if ($signed(((wire20 ?
              (wire21 ? $signed((8'hb1)) : wire16) : $signed($signed(wire16))) ?
          $signed(wire19[(1'h0):(1'h0)]) : $unsigned(((-wire17) ?
              (-wire22) : $signed(wire22))))))
        begin
          reg23 <= (wire17 <= $unsigned((({(8'ha5), (8'hb3)} ?
              $unsigned(wire21) : $unsigned(wire21)) == $signed((~^wire19)))));
          reg24 <= $unsigned(((&(&$signed(reg23))) ^~ ((wire20[(3'h4):(3'h4)] ?
                  wire19 : (wire16 ? wire21 : (8'h9c))) ?
              {wire21} : (&$signed(wire18)))));
        end
      else
        begin
          if (($unsigned((wire17 ~^ ({wire21} ?
              $unsigned((8'haa)) : wire18[(1'h0):(1'h0)]))) == (reg23[(5'h11):(4'h8)] >= wire18)))
            begin
              reg23 <= $signed(wire20[(1'h1):(1'h0)]);
              reg24 <= (~&$signed(reg24));
            end
          else
            begin
              reg23 <= ($signed(wire18[(3'h7):(3'h5)]) > (-$signed(reg23[(3'h5):(2'h3)])));
              reg24 <= wire18;
            end
          reg25 <= wire16;
          reg26 <= $signed((|wire22));
          reg27 <= $unsigned((^~$unsigned((&(wire17 ? reg25 : wire17)))));
          reg28 <= (+wire16[(2'h3):(2'h3)]);
        end
      reg29 <= (wire18[(4'he):(4'h9)] ?
          $unsigned(wire22[(4'hc):(4'h8)]) : $signed($signed(wire17)));
      reg30 <= {((wire22[(2'h3):(2'h3)] ?
                  wire22 : $unsigned({(8'hb2), wire21})) ?
              {{{reg25}, $signed(reg23)},
                  ($unsigned(wire21) && $unsigned(wire19))} : (((~^wire16) <<< $unsigned(reg26)) <= {{wire16,
                      reg29}}))};
      reg31 <= ($signed(((reg24[(3'h4):(3'h4)] ?
                  $unsigned(reg29) : $signed((7'h44))) ?
              $unsigned($unsigned(wire17)) : $signed((reg28 * reg27)))) ?
          $signed(($signed($signed((8'ha9))) ?
              reg28 : ((wire22 && wire21) < (~wire18)))) : reg25[(5'h11):(5'h11)]);
      reg32 <= ((reg25 ?
              ($signed((reg31 > reg25)) ?
                  $unsigned((reg23 && wire22)) : (8'ha5)) : {{$unsigned(reg25)},
                  (8'hb5)}) ?
          wire16 : (&$unsigned((|(reg30 ? reg31 : wire17)))));
    end
  assign wire33 = wire19[(3'h5):(2'h2)];
  assign wire34 = (!((^~$unsigned($unsigned(wire22))) <= $signed((reg26 >= ((8'haa) ?
                      (8'hac) : reg31)))));
  always
    @(posedge clk) begin
      reg35 <= (~|({({reg29, (8'h9f)} ?
              (wire19 ~^ wire33) : reg32[(5'h14):(4'he)])} == wire22[(2'h2):(1'h0)]));
    end
  assign wire36 = $unsigned({$signed(({reg31} <<< (reg30 | wire19)))});
  assign wire37 = reg32[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg38 <= reg28[(3'h5):(1'h1)];
    end
endmodule
