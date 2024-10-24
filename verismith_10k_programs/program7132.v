module top
#(parameter param164 = (^(|({((8'hb8) ? (8'ha1) : (8'hbb)), {(8'hb5)}} ? (((8'h9d) + (7'h41)) >>> ((8'ha5) ? (8'hb3) : (7'h40))) : (~|(^(8'ha5)))))), 
parameter param165 = (^~(7'h44)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire162;
  wire signed [(4'hc):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire68;
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  assign y = {wire162,
                 wire160,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire22,
                 wire68,
                 reg163,
                 (1'h0)};
  assign wire4 = {(!$signed(($signed(wire1) & wire3)))};
  assign wire5 = (wire4 != wire1[(2'h3):(1'h1)]);
  assign wire6 = $signed(({wire5[(2'h2):(1'h1)],
                     (wire2 ?
                         (~^wire5) : {wire4})} >> ((!(wire2 ^~ wire5)) > $unsigned(wire0))));
  assign wire7 = {wire5[(1'h0):(1'h0)]};
  module8 #() modinst23 (wire22, clk, wire1, wire5, wire7, wire6);
  module24 #() modinst69 (.clk(clk), .y(wire68), .wire29(wire2), .wire26(wire5), .wire28(wire4), .wire25(wire7), .wire27(wire22));
  module70 #() modinst161 (.clk(clk), .wire72(wire22), .wire74(wire4), .y(wire160), .wire71(wire3), .wire73(wire1));
  assign wire162 = wire2;
  always
    @(posedge clk) begin
      reg163 <= (((((wire160 ? wire6 : wire6) ?
              wire5[(1'h1):(1'h0)] : (wire22 << wire22)) > $signed($unsigned(wire6))) | wire68) ?
          (wire6[(3'h6):(2'h2)] ?
              wire22 : {(wire160[(1'h1):(1'h0)] ?
                      $unsigned(wire4) : $unsigned(wire3)),
                  {(|wire162)}}) : (~|(^{(wire5 > wire162)})));
    end
endmodule

module module70
#(parameter param158 = (((({(8'hac), (8'ha4)} ? ((8'ha0) * (8'h9d)) : (~^(8'ha9))) | (((8'hb1) ? (8'hb7) : (7'h40)) - ((8'hb5) << (8'ha1)))) & {(~{(7'h40)})}) ? (~|({(+(7'h42)), (~^(7'h42))} ? (~&{(8'hb2)}) : ({(8'hbe), (7'h41)} || {(8'hb4), (8'haf)}))) : ((~((|(8'hbc)) >= ((8'ha3) * (8'ha1)))) ? (~(~^((8'hb1) ? (8'hb3) : (8'hb5)))) : (({(8'hb1), (8'hbf)} ^~ ((8'h9d) ? (8'hb5) : (8'hbe))) ? {((8'ha9) ? (8'ha2) : (8'hb8))} : (((8'hbf) > (8'h9e)) ? ((8'hbc) > (8'hbd)) : (~&(7'h44)))))), 
parameter param159 = {(|{{{param158}}})})
(y, clk, wire71, wire72, wire73, wire74);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire71;
  input wire [(5'h11):(1'h0)] wire72;
  input wire signed [(4'hd):(1'h0)] wire73;
  input wire [(5'h15):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire155;
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  assign y = {wire157,
                 wire75,
                 wire76,
                 wire87,
                 wire124,
                 wire126,
                 wire127,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire155,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 (1'h0)};
  assign wire75 = $unsigned($unsigned(wire72[(2'h2):(1'h0)]));
  assign wire76 = {wire73[(4'hd):(2'h2)]};
  module77 #() modinst88 (wire87, clk, wire73, wire72, wire75, wire76);
  module89 #() modinst125 (wire124, clk, wire73, wire72, wire75, wire74);
  assign wire126 = ($signed(((8'ha8) - $unsigned((^wire74)))) ?
                       $unsigned(wire87[(3'h6):(2'h2)]) : wire87);
  assign wire127 = ($signed(((wire126 || (wire76 ?
                           wire71 : wire124)) <= ($signed((7'h40)) ?
                           wire126 : $signed(wire71)))) ?
                       wire73 : {$signed(($unsigned(wire87) ?
                               (wire126 ~^ wire71) : (wire72 <<< wire71))),
                           (($signed(wire71) | ((8'ha4) >= wire71)) + $unsigned((wire76 != wire72)))});
  always
    @(posedge clk) begin
      if ((((wire87 ?
          $unsigned($unsigned(wire87)) : ($unsigned(wire87) ?
              (wire74 - (8'hba)) : (|wire87))) >= (wire126 ~^ wire73)) && $unsigned((!wire124))))
        begin
          reg128 <= (8'haa);
        end
      else
        begin
          reg128 <= (^reg128);
          reg129 <= {$signed($signed(wire74)),
              (((!(reg128 & wire74)) <= $signed($signed(wire124))) ?
                  (($signed((7'h41)) ?
                          (wire72 ? wire127 : (8'hbc)) : (wire72 < wire126)) ?
                      $unsigned($unsigned(wire127)) : wire75[(4'hb):(3'h7)]) : $signed((~|((8'ha9) * wire126))))};
          reg130 <= ((wire127[(5'h12):(4'hb)] << (wire73[(2'h2):(1'h0)] | $signed((~&wire76)))) | $unsigned($signed($signed((wire75 ?
              wire87 : (8'ha5))))));
          if ((($unsigned(((8'ha2) <= (wire75 <= wire73))) ?
                  $unsigned((8'haf)) : wire73) ?
              $unsigned(($signed($unsigned(wire76)) ?
                  $signed($signed((8'hba))) : ($unsigned(wire74) ?
                      $signed(wire71) : wire71))) : wire72[(3'h4):(2'h3)]))
            begin
              reg131 <= {(&(~^(wire126 * (wire74 ? reg128 : wire74))))};
            end
          else
            begin
              reg131 <= (8'hbd);
              reg132 <= $signed(wire75);
            end
        end
      reg133 <= {(8'hb9), wire87[(4'hf):(4'hf)]};
    end
  assign wire134 = wire74[(4'hf):(4'hf)];
  assign wire135 = $signed({(wire73 >> (|(8'hbb)))});
  assign wire136 = wire135[(2'h2):(1'h0)];
  assign wire137 = reg133;
  module138 #() modinst156 (wire155, clk, wire135, wire72, reg132, wire137);
  assign wire157 = $unsigned(wire124[(2'h3):(1'h1)]);
endmodule

module module24
#(parameter param66 = (({(((8'hb0) ? (7'h44) : (7'h42)) & (+(8'hab))), ((8'h9e) ? ((8'haf) ? (8'ha6) : (8'hbf)) : ((8'hab) >= (8'hb9)))} ? ({((8'hba) ? (8'hac) : (8'ha1))} - ((~^(7'h41)) ? (~|(8'hb6)) : ((8'hb1) ? (8'ha4) : (8'hbc)))) : ((^~(~|(8'hb7))) * {{(8'haa), (8'hb8)}})) | (((8'hb7) ^~ {((8'hbf) ? (8'ha5) : (8'ha7)), (|(8'h9c))}) - {(^(8'h9f)), ((!(8'hb1)) ? (!(7'h42)) : ((8'hae) ? (7'h41) : (8'had)))})), 
parameter param67 = param66)
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire28;
  input wire [(4'he):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(4'ha):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire52;
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 reg59,
                 (1'h0)};
  module30 #() modinst53 (wire52, clk, wire27, wire26, wire25, wire29, wire28);
  assign wire54 = wire25;
  assign wire55 = ({(-(~&wire27))} ?
                      ($signed(wire52) & (wire27[(5'h12):(2'h3)] ?
                          ((^~wire29) ?
                              $signed(wire52) : (wire26 > wire26)) : {(^wire54),
                              wire29})) : wire27[(4'he):(1'h1)]);
  assign wire56 = wire25;
  assign wire57 = $unsigned(($signed((wire55[(5'h10):(4'he)] ?
                          wire55[(5'h14):(5'h10)] : (wire28 >> wire55))) ?
                      {{(wire27 ? wire54 : wire27), (wire26 || wire54)},
                          $signed($unsigned(wire29))} : $unsigned(wire52[(3'h5):(1'h1)])));
  assign wire58 = $signed({(|$signed(wire57))});
  always
    @(posedge clk) begin
      reg59 <= wire55[(3'h5):(2'h3)];
    end
  assign wire60 = $unsigned((($signed(reg59[(2'h3):(1'h1)]) ?
                          (wire26[(3'h4):(2'h2)] - (^~wire57)) : $signed((8'hbe))) ?
                      $unsigned({(^~wire28),
                          $unsigned(wire27)}) : ($unsigned(wire56[(1'h1):(1'h0)]) ?
                          wire56 : wire25)));
  assign wire61 = (|$unsigned(wire56));
  assign wire62 = wire60;
  assign wire63 = reg59[(3'h6):(2'h3)];
  assign wire64 = ((wire28[(3'h4):(1'h0)] * $signed($unsigned($signed((7'h41))))) ?
                      $unsigned($unsigned((-(+wire27)))) : wire52[(3'h4):(1'h1)]);
  assign wire65 = $signed($signed({wire54[(1'h0):(1'h0)]}));
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire13,
                 reg16,
                 (1'h0)};
  assign wire13 = (8'ha1);
  assign wire14 = wire9;
  assign wire15 = (~|(wire9 ?
                      ($unsigned({wire11}) ?
                          wire10[(2'h2):(2'h2)] : $signed($unsigned(wire10))) : (^~wire9[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg16 <= $signed($unsigned(((~wire14) ?
          wire14[(4'hf):(4'hc)] : $unsigned((wire13 ? wire15 : wire9)))));
    end
  assign wire17 = $signed(wire13[(2'h2):(1'h0)]);
  assign wire18 = wire15;
  assign wire19 = $unsigned($unsigned({wire14[(1'h1):(1'h1)],
                      $unsigned($unsigned(reg16))}));
  assign wire20 = $signed(((-$unsigned((|wire11))) ? wire12 : (+(8'hb3))));
  assign wire21 = $unsigned((({(wire10 ? wire13 : wire10),
                          (wire11 ? wire18 : wire19)} ?
                      {$signed(wire10)} : reg16) ^~ (!(wire13[(4'ha):(1'h1)] >>> (wire15 ?
                      wire18 : wire18)))));
endmodule

module module30
#(parameter param50 = ({((((8'ha5) ? (8'h9c) : (8'ha8)) ? (~^(8'hbe)) : ((8'ha7) && (8'h9e))) - (8'hb0))} >= (((^((7'h41) ? (8'hb1) : (7'h43))) > {((8'hbd) * (8'ha9))}) & (8'h9c))), 
parameter param51 = (^~param50))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire [(4'ha):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  input wire [(4'he):(1'h0)] wire32;
  input wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire38;
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  assign y = {wire49,
                 wire38,
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
                 reg37,
                 reg36,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg36 <= {$signed($unsigned($unsigned((|wire35))))};
      reg37 <= $signed({($unsigned(((8'hbe) ?
              (7'h40) : wire35)) < $unsigned((reg36 <= wire35))),
          $unsigned(({wire32} ? $signed(wire34) : (wire35 || wire32)))});
    end
  assign wire38 = (^wire32[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg39 <= wire31;
      reg40 <= $unsigned((wire32[(4'hd):(3'h6)] ?
          $unsigned(reg37) : $unsigned((!$signed(wire35)))));
      if ($unsigned($unsigned((($signed(reg36) ? wire38 : $unsigned(reg37)) ?
          (+$signed(reg40)) : $unsigned((+wire33))))))
        begin
          reg41 <= {(~&reg40), reg39};
          reg42 <= ({reg37} ^ (reg37 & {(^~$unsigned(wire35)), {(~&wire38)}}));
          if (wire32[(3'h7):(1'h0)])
            begin
              reg43 <= $signed($unsigned(((((8'hbe) ? wire35 : reg41) ?
                  (reg40 ? (7'h43) : reg39) : (wire35 ?
                      (8'hb7) : wire32)) && wire34)));
              reg44 <= $unsigned(wire38);
              reg45 <= (((!wire32) & reg40[(2'h2):(1'h0)]) ?
                  (&(reg42[(4'ha):(3'h6)] ~^ reg39)) : (~&($signed({reg42,
                      reg40}) ^ $unsigned((wire31 | reg43)))));
              reg46 <= $signed(wire33);
            end
          else
            begin
              reg43 <= $signed($signed($unsigned(($unsigned(wire33) | wire38[(2'h2):(1'h1)]))));
              reg44 <= $signed(wire31[(3'h4):(2'h2)]);
              reg45 <= $signed(reg41[(5'h12):(4'h8)]);
            end
        end
      else
        begin
          if (reg46[(3'h6):(3'h6)])
            begin
              reg41 <= reg39[(2'h3):(2'h2)];
              reg42 <= reg43;
              reg43 <= (reg39[(4'h8):(3'h4)] << $signed((8'ha9)));
            end
          else
            begin
              reg41 <= ($signed($signed({(+(8'hb9)),
                  $unsigned(wire33)})) && wire31[(3'h5):(3'h5)]);
              reg42 <= reg43;
            end
        end
      reg47 <= $unsigned(reg44[(3'h7):(1'h1)]);
      reg48 <= (^reg47[(1'h1):(1'h0)]);
    end
  assign wire49 = (~reg37);
endmodule

module module138  (y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire142;
  input wire signed [(5'h11):(1'h0)] wire141;
  input wire [(2'h3):(1'h0)] wire140;
  input wire signed [(4'he):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire154;
  wire [(5'h14):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire143;
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire143,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire143 = $unsigned($signed({((wire140 - wire141) ?
                           (wire141 <<< wire142) : wire141[(4'hd):(2'h3)])}));
  always
    @(posedge clk) begin
      if ($signed(((~|wire140[(1'h0):(1'h0)]) ^~ ($signed($signed((8'hb9))) <= ((wire139 ?
              wire141 : wire139) ?
          wire140[(1'h1):(1'h1)] : $signed(wire142))))))
        begin
          if (($unsigned((wire142[(2'h2):(2'h2)] <= ((wire139 << wire142) ?
                  (wire143 ? wire140 : wire142) : (|wire139)))) ?
              {((~|(8'ha6)) ~^ wire139[(3'h4):(1'h1)])} : (8'ha4)))
            begin
              reg144 <= ($unsigned(wire140) < wire139);
              reg145 <= ((&(|$signed(((7'h44) - wire141)))) ?
                  wire143[(1'h0):(1'h0)] : (wire140[(1'h0):(1'h0)] ?
                      $unsigned((wire140 ?
                          wire141 : (wire142 ? reg144 : wire143))) : wire139));
              reg146 <= $signed($unsigned(reg145));
            end
          else
            begin
              reg144 <= $unsigned((~^((!(reg145 | reg144)) < $signed(wire140[(2'h3):(1'h1)]))));
            end
          if ($unsigned($signed($unsigned((^$signed(reg146))))))
            begin
              reg147 <= (((wire139 ?
                  reg144 : $signed((^~reg146))) ~^ (((reg145 ?
                      reg145 : reg145) ?
                  wire139 : $unsigned((8'hb0))) & (wire142[(2'h3):(2'h3)] ^~ (8'hb1)))) > ($signed(({wire142} ?
                      $unsigned(wire140) : $unsigned(reg144))) ?
                  $signed(wire142[(2'h2):(1'h1)]) : $signed((wire143[(4'h9):(1'h1)] - (reg144 ^~ wire143)))));
            end
          else
            begin
              reg147 <= (reg144[(3'h6):(3'h6)] | (wire140[(2'h2):(1'h1)] ?
                  ((wire143 ? reg144 : $unsigned(reg147)) | {$unsigned(wire140),
                      wire139}) : {{$unsigned(wire139), {reg147, reg146}},
                      (8'ha2)}));
            end
          if ($signed($unsigned((~|wire139[(3'h5):(1'h0)]))))
            begin
              reg148 <= ((+$unsigned(((wire139 + reg144) ?
                  $unsigned(wire140) : $signed(wire140)))) >> (($signed($unsigned(reg145)) - ($signed(reg144) >>> (reg145 ?
                  reg144 : (8'hbc)))) | {(~{reg144}),
                  {$signed(reg147), $signed(wire140)}}));
              reg149 <= wire142;
              reg150 <= $signed(reg149[(4'hb):(3'h7)]);
              reg151 <= (^~($signed($signed(reg149)) ?
                  {{wire142, $unsigned(reg148)},
                      $unsigned(reg149)} : $signed((+(reg145 >= reg147)))));
              reg152 <= ((((reg147 << {reg151}) ?
                      reg147 : wire142) || ({(|reg144), (wire139 >= wire140)} ?
                      (&wire142[(1'h1):(1'h1)]) : (!wire142))) ?
                  $unsigned(wire142) : ($unsigned(wire141) ?
                      $signed(((-wire142) ?
                          ((7'h43) ?
                              wire143 : reg151) : $signed((8'h9d)))) : $unsigned(reg148[(4'h8):(3'h4)])));
            end
          else
            begin
              reg148 <= $unsigned($unsigned(reg147));
              reg149 <= (-(&($signed({reg147,
                  wire142}) | reg152[(4'hb):(1'h0)])));
              reg150 <= $unsigned($signed((((8'h9f) ?
                      (wire141 ~^ reg150) : reg149[(4'h9):(3'h6)]) ?
                  {$signed(reg148)} : reg148)));
            end
        end
      else
        begin
          reg144 <= $signed(reg148);
          if ($unsigned(reg144[(1'h1):(1'h1)]))
            begin
              reg145 <= {$signed((($unsigned(reg144) ?
                          reg144[(5'h11):(1'h1)] : reg144) ?
                      reg144[(4'ha):(3'h5)] : {reg147, $signed(reg151)}))};
            end
          else
            begin
              reg145 <= reg147;
            end
        end
    end
  assign wire153 = (reg144 & wire141);
  assign wire154 = reg147[(1'h0):(1'h0)];
endmodule

module module89
#(parameter param123 = {({(~&(^(7'h42))), (((8'hb9) ? (8'hbf) : (8'h9c)) ? (^~(8'ha5)) : (8'ha5))} ? (|((!(8'hb4)) ? {(8'ha9), (8'hb6)} : (|(8'hb8)))) : ((((8'hb2) != (8'ha3)) >> ((8'ha9) ? (8'hb6) : (7'h41))) | (8'hbd))), (((~|((8'ha9) ? (7'h43) : (8'ha0))) ? (((8'ha5) >> (8'hbb)) ? ((7'h42) & (8'ha2)) : (^~(7'h43))) : (~&{(8'hac), (8'hb0)})) & ((|((8'hb4) ? (8'hbc) : (8'ha8))) ? (~&((8'ha7) == (8'hb3))) : (((8'hb6) <<< (8'hac)) >> ((8'ha1) ? (8'hbd) : (7'h41)))))})
(y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire93;
  input wire [(3'h6):(1'h0)] wire92;
  input wire [(4'hf):(1'h0)] wire91;
  input wire signed [(5'h11):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire signed [(5'h12):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire94 = $signed(wire93);
  assign wire95 = ($signed((!wire90)) << (-(wire93 + $unsigned((wire90 ?
                      (8'hb8) : wire93)))));
  assign wire96 = $unsigned($unsigned((~&(wire91[(4'hd):(2'h2)] ^ (&wire93)))));
  assign wire97 = (wire96 ? wire92[(3'h5):(1'h1)] : (~&(wire92 < wire94)));
  assign wire98 = (8'h9e);
  assign wire99 = wire98[(4'hc):(4'ha)];
  assign wire100 = $signed($unsigned(((^~(~|wire95)) || $unsigned(wire95))));
  always
    @(posedge clk) begin
      if ($signed(wire91))
        begin
          reg101 <= (wire95 ?
              (&$signed(((^~wire95) > (|(7'h41))))) : (wire92[(3'h6):(3'h4)] <= $signed($signed($signed(wire94)))));
          reg102 <= ((+wire100) ?
              ($signed(wire96[(4'he):(2'h2)]) ?
                  $signed($unsigned((~^wire95))) : (((!wire98) ?
                          (wire98 ? (8'h9c) : wire93) : $unsigned(wire90)) ?
                      wire91 : wire95)) : $signed((|(&wire98))));
          reg103 <= (8'ha6);
          reg104 <= ((-$unsigned(wire93[(2'h3):(2'h2)])) ?
              wire99[(4'hd):(1'h1)] : wire90);
        end
      else
        begin
          reg101 <= wire94[(3'h6):(2'h3)];
        end
      reg105 <= $signed(wire96);
      reg106 <= $unsigned($unsigned(wire97));
      if ($signed(wire97))
        begin
          if ($unsigned(wire91[(3'h6):(1'h1)]))
            begin
              reg107 <= wire93;
              reg108 <= (~|$unsigned($unsigned((8'hba))));
              reg109 <= {wire91,
                  ($unsigned($unsigned((-(8'hb5)))) ?
                      (($signed(reg103) ? (&wire90) : (+wire92)) ?
                          wire99[(4'hb):(4'ha)] : (&(~reg108))) : (wire98[(4'hd):(4'ha)] ?
                          reg106 : wire90))};
              reg110 <= ($unsigned($unsigned((8'hb8))) < wire91[(4'he):(3'h5)]);
              reg111 <= reg108;
            end
          else
            begin
              reg107 <= (reg105 ?
                  (~$signed(wire98)) : ((($signed(reg109) | (~reg111)) ?
                          ((reg103 + wire91) ^~ $unsigned(reg110)) : (8'hbf)) ?
                      ({(wire94 + reg106)} << (&(reg108 ^ wire100))) : wire97));
              reg108 <= ($unsigned((~|reg109)) != $signed($unsigned(($unsigned(reg104) ?
                  (!(8'ha4)) : (reg107 ? reg108 : (8'ha2))))));
              reg109 <= $unsigned($unsigned($signed($signed(reg104))));
            end
          reg112 <= (((($signed(reg109) ?
              {wire99, wire90} : reg110[(2'h2):(1'h1)]) | $unsigned((wire100 ?
              wire93 : wire91))) - (({reg106} * (^(8'h9d))) ?
              $unsigned($signed(reg107)) : (+$signed(reg101)))) >= reg109[(3'h7):(3'h6)]);
          reg113 <= $signed(reg108[(1'h1):(1'h0)]);
        end
      else
        begin
          reg107 <= $unsigned(reg106[(4'he):(4'hc)]);
          if ({((reg101[(2'h3):(1'h0)] && ((|wire98) ?
                  reg111[(4'ha):(2'h3)] : $signed(reg103))) == {reg110,
                  (8'hab)})})
            begin
              reg108 <= (+(($signed($unsigned(wire90)) | reg108) ?
                  (8'hbf) : (((reg102 << reg107) | $signed(reg113)) ?
                      (~|$unsigned(reg105)) : (((8'hb6) && reg105) ?
                          (^wire91) : (~&wire97)))));
              reg109 <= $unsigned((^~reg104));
              reg110 <= ($unsigned((wire91[(4'h9):(3'h5)] ?
                      ($signed(wire92) < $signed(reg113)) : $signed(reg102[(5'h11):(3'h6)]))) ?
                  reg111[(4'h8):(2'h2)] : wire90);
              reg111 <= reg111;
            end
          else
            begin
              reg108 <= (wire96 ? reg111 : reg108);
              reg109 <= reg110[(1'h0):(1'h0)];
              reg110 <= (^(^~($signed($signed(reg112)) - wire97)));
              reg111 <= $unsigned(((8'h9c) + $unsigned(reg104[(3'h4):(2'h3)])));
            end
          reg112 <= wire99;
          reg113 <= (reg106[(2'h3):(2'h3)] ?
              reg109 : ($signed((^{reg104})) << {wire92[(1'h1):(1'h1)],
                  reg105[(3'h5):(3'h5)]}));
          if (((+($signed($unsigned(wire92)) ? reg112 : reg103)) ?
              $signed((8'hb9)) : {{($unsigned((8'hb9)) ?
                          (reg102 ? reg101 : (8'hb5)) : (wire98 ?
                              reg109 : (8'h9d))),
                      {wire97[(2'h3):(2'h3)], $signed(reg109)}}}))
            begin
              reg114 <= $signed(({reg112[(3'h6):(3'h5)]} >>> wire92));
              reg115 <= wire90[(4'h8):(1'h0)];
            end
          else
            begin
              reg114 <= $signed(reg111[(5'h10):(3'h7)]);
              reg115 <= reg112;
              reg116 <= reg114;
            end
        end
    end
  assign wire117 = $unsigned(({wire90[(4'hc):(1'h1)],
                       ((~reg112) ?
                           $unsigned(reg108) : reg101[(2'h3):(1'h1)])} <= (wire97[(4'h8):(3'h4)] & ((wire93 >>> reg106) ?
                       wire99 : $signed(wire90)))));
  assign wire118 = $unsigned((({$unsigned(wire97), wire99[(1'h0):(1'h0)]} ?
                       $signed(reg108) : ({wire94, reg102} ?
                           wire100 : (wire117 ^~ wire94))) && (~&((wire97 ?
                           (8'hb7) : wire99) ?
                       (reg113 ^~ reg112) : (reg109 ? reg107 : reg103)))));
  assign wire119 = $signed((((~|(wire90 ? (8'hb9) : reg113)) ?
                           wire100[(1'h1):(1'h1)] : reg101) ?
                       (^{{wire91, wire92},
                           $unsigned(wire118)}) : $unsigned((8'hb8))));
  assign wire120 = (wire95 ?
                       {(($unsigned(reg103) >= (wire97 ? wire97 : wire97)) ?
                               $unsigned($unsigned(wire98)) : ($unsigned(wire100) > $signed(wire100))),
                           (|((reg106 ? reg105 : reg113) ?
                               (wire119 << wire118) : {wire98,
                                   wire119}))} : {(reg112 > ({reg107,
                               reg116} != wire118[(2'h3):(2'h2)])),
                           reg103[(1'h1):(1'h1)]});
  assign wire121 = (wire91[(4'hc):(4'h8)] | $signed(reg108[(3'h5):(2'h3)]));
  assign wire122 = $unsigned($unsigned(reg110[(2'h2):(2'h2)]));
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire81;
  input wire [(3'h7):(1'h0)] wire80;
  input wire [(4'he):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  assign y = {wire86, wire85, wire84, wire83, wire82, (1'h0)};
  assign wire82 = ((wire80 | $signed((wire81[(1'h1):(1'h0)] | (wire80 > wire79)))) >>> (wire78[(3'h7):(3'h5)] ~^ (+$unsigned(wire78[(4'he):(4'he)]))));
  assign wire83 = ($signed($signed(wire80)) ?
                      ((wire80[(2'h3):(1'h1)] - $signed((^wire79))) >>> (~&(((7'h40) - wire81) ?
                          (wire79 | wire79) : (+wire79)))) : $signed($unsigned((8'ha1))));
  assign wire84 = wire81[(3'h4):(1'h1)];
  assign wire85 = ((-$signed(($signed(wire83) & wire82))) ?
                      wire80 : $signed($unsigned(wire84[(3'h7):(1'h0)])));
  assign wire86 = $signed((wire79 ^ ($signed((wire78 ?
                      (8'hb0) : wire81)) > ($signed(wire81) - (wire83 + wire84)))));
endmodule
