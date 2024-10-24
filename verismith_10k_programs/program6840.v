module top
#(parameter param49 = ((|(~|(((8'hb8) ? (8'h9c) : (8'ha8)) ? ((8'h9d) ? (8'hac) : (8'hac)) : ((8'h9f) >>> (8'hb4))))) ? ((((|(8'hbe)) & {(8'hb1), (8'h9d)}) ? (!(~&(8'ha8))) : {(~(8'hac)), (8'ha3)}) <= ({{(7'h41), (8'hb9)}, ((8'h9e) ? (7'h40) : (8'hbd))} ? {(^~(8'hbb)), ((8'hbd) - (8'h9c))} : {((7'h44) << (8'ha1)), ((7'h42) ? (8'hbd) : (8'ha9))})) : ((8'ha0) ^ ((((8'ha5) ? (8'h9e) : (8'hba)) ? ((8'hb9) ? (7'h42) : (8'hb4)) : ((8'ha8) ? (8'ha3) : (8'hb6))) ? (^(!(8'h9c))) : (~|(|(8'hbb)))))), 
parameter param50 = param49)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire47;
  assign y = {wire5, wire6, wire7, wire8, wire9, wire10, wire47, (1'h0)};
  assign wire5 = $unsigned(wire3);
  assign wire6 = $unsigned($signed($unsigned($signed((wire0 || wire2)))));
  assign wire7 = wire1[(2'h2):(1'h1)];
  assign wire8 = (((~|(^(!wire7))) ?
                         wire6[(4'h9):(2'h2)] : wire2[(1'h0):(1'h0)]) ?
                     (~^$signed((wire3[(2'h2):(1'h0)] > $unsigned(wire4)))) : ($unsigned((~^(wire1 || wire0))) ?
                         (+$unsigned(((8'hb6) ?
                             wire7 : wire3))) : (~|(^~((8'hbb) ?
                             (8'ha1) : wire4)))));
  assign wire9 = (wire5 >> wire5);
  assign wire10 = (~&$signed($signed((-(wire7 ? wire6 : wire4)))));
  module11 #() modinst48 (wire47, clk, wire10, wire5, wire7, wire9, wire4);
endmodule

module module11
#(parameter param46 = {({(((8'h9e) ? (8'hbb) : (8'h9d)) ? ((8'had) ? (8'hbf) : (8'haf)) : ((8'hb3) ? (8'haa) : (8'hb8)))} ? {(~^(-(8'hb8))), (~((8'hb9) ? (8'ha4) : (8'hb7)))} : (({(8'hba), (8'ha5)} ^~ (^(8'ha5))) >= (!{(8'hb6), (8'hb3)}))), (+(((^(8'hba)) <= (&(8'hb0))) || (8'ha4)))})
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  assign y = {wire38,
                 wire36,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire17 = wire13[(4'h9):(3'h4)];
  assign wire18 = $signed(wire13);
  assign wire19 = wire18;
  assign wire20 = (wire16 << $signed(($unsigned((!wire17)) + $signed($signed(wire15)))));
  assign wire21 = wire19;
  module22 #() modinst37 (wire36, clk, wire19, wire17, wire15, wire21);
  assign wire38 = wire17[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg39 <= $signed((($signed((wire12 < wire13)) & ((+wire13) ^ wire19)) && wire18[(3'h7):(3'h6)]));
      reg40 <= (~wire16);
      reg41 <= ((!$unsigned({$unsigned(reg40), (wire21 | wire19)})) ?
          $signed(($signed($signed(wire38)) && (~^{wire21}))) : reg39[(3'h6):(1'h0)]);
      if (wire16[(3'h7):(1'h1)])
        begin
          reg42 <= wire19;
        end
      else
        begin
          if (wire36[(1'h1):(1'h1)])
            begin
              reg42 <= (reg42[(2'h3):(2'h3)] != reg39);
            end
          else
            begin
              reg42 <= $signed($unsigned(({reg42, (reg40 ? wire19 : wire21)} ?
                  wire13[(3'h5):(1'h1)] : $unsigned(reg42[(2'h3):(2'h2)]))));
              reg43 <= (^~$signed(($signed({wire17,
                  wire36}) >> ($unsigned((8'ha0)) ?
                  (wire21 + reg41) : (reg42 >= (8'ha3))))));
            end
          reg44 <= wire13;
          reg45 <= $unsigned(wire19);
        end
    end
endmodule

module module22
#(parameter param34 = {(((!(|(8'hae))) <<< (((8'hb4) ? (8'had) : (8'hb1)) ? (~|(8'had)) : ((7'h41) ? (8'hb2) : (8'ha4)))) ? ((((7'h41) ? (8'hb3) : (7'h41)) ^~ ((7'h42) ? (8'hac) : (8'hbf))) ? {(^~(8'hb9))} : (((8'hac) ^~ (8'hb4)) != ((8'hb9) == (8'hb5)))) : ((((8'ha2) >> (7'h42)) - ((8'hb4) <= (8'hb7))) - (&{(8'h9e), (7'h40)})))}, 
parameter param35 = (~^{{param34, (&{(8'ha3), param34})}, ((param34 ? (~param34) : param34) || (+param34))}))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  assign y = {wire33, wire32, wire31, wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = ((~&(!wire24[(4'hb):(2'h2)])) > wire24[(3'h7):(3'h5)]);
  assign wire28 = ($unsigned((&wire23[(2'h3):(2'h3)])) ?
                      $unsigned((~|({wire26} ^~ (wire25 ?
                          wire26 : (8'hb9))))) : wire23[(4'hf):(4'hb)]);
  assign wire29 = ({wire24} << {(($unsigned(wire23) >>> (wire25 ?
                          wire25 : (8'ha4))) <= ($unsigned(wire24) << wire26[(5'h11):(2'h3)]))});
  assign wire30 = wire29[(4'h8):(4'h8)];
  assign wire31 = (^~{$unsigned(wire28), (|$unsigned($unsigned(wire29)))});
  assign wire32 = wire30;
  assign wire33 = (($signed(wire26) | wire31[(1'h0):(1'h0)]) > wire27[(2'h2):(1'h1)]);
endmodule
