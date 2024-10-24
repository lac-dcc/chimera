module top
#(parameter param314 = ((((((8'ha5) ? (8'hb0) : (8'hb4)) ? ((8'hbf) ? (8'hbe) : (8'haa)) : (&(8'ha9))) ? (((7'h44) << (7'h43)) + (!(8'hbe))) : ((^(8'haf)) <<< ((8'hbb) ~^ (7'h42)))) ? {(((8'hb0) ? (8'hb7) : (8'ha5)) ~^ (^~(8'hb5)))} : ((((7'h42) ? (8'ha4) : (8'hba)) & (-(8'ha7))) ? (-((8'had) ~^ (8'ha9))) : (~|(~^(8'ha6))))) == (((8'hb6) ? {((8'hbe) >>> (8'hb5)), ((8'hac) != (8'ha5))} : {((8'hbb) ? (8'hb8) : (8'ha2))}) ? ((((8'hb8) - (8'h9c)) > ((8'ha3) ? (8'h9c) : (8'hb9))) ? (((8'haa) >> (8'hb0)) != (~|(8'haf))) : (((8'h9c) >> (8'ha2)) | ((7'h41) - (8'hb4)))) : {((-(8'hb6)) >>> ((8'haa) ? (8'ha6) : (8'hbf)))})), 
parameter param315 = (({{((8'ha4) >= param314), (param314 ? (8'hbd) : param314)}, {(param314 ? param314 : param314)}} ? ({(param314 ? (7'h43) : (8'hb9)), (param314 + param314)} >> ((param314 >>> param314) ? {param314} : (param314 <<< param314))) : (param314 ^ param314)) ? (~^({{param314}} >>> ((param314 == (7'h40)) ? (&param314) : (param314 ^ param314)))) : ((8'hb7) ~^ (8'hb8))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h220):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire312;
  wire signed [(4'hb):(1'h0)] wire310;
  wire signed [(5'h13):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire62;
  reg signed [(4'hb):(1'h0)] reg313 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  assign y = {wire312,
                 wire310,
                 wire152,
                 wire151,
                 wire150,
                 wire142,
                 wire25,
                 wire7,
                 wire6,
                 wire5,
                 wire27,
                 wire28,
                 wire46,
                 wire62,
                 reg313,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 (1'h0)};
  assign wire5 = {$signed((wire3[(3'h5):(3'h5)] ?
                         $signed(((8'hbd) < wire3)) : ({wire0, wire0} ?
                             {(8'hba)} : (wire3 ? wire2 : wire1)))),
                     wire3};
  assign wire6 = wire0;
  assign wire7 = wire3[(3'h7):(3'h4)];
  module8 #() modinst26 (.wire12(wire1), .wire13(wire4), .y(wire25), .wire11(wire0), .clk(clk), .wire9(wire7), .wire10(wire2));
  assign wire27 = (~$unsigned(wire4));
  assign wire28 = (^~{wire1[(3'h4):(1'h1)]});
  always
    @(posedge clk) begin
      if (((|($signed((wire27 ? wire7 : wire27)) ?
              $signed(wire0) : ((~&wire2) >= (+(8'hb9))))) ?
          wire1[(3'h4):(3'h4)] : (~|wire3[(3'h4):(2'h3)])))
        begin
          reg29 <= $signed(($unsigned((-$unsigned(wire27))) == (^(~{wire1}))));
          if ($signed(wire25))
            begin
              reg30 <= ((wire27[(3'h6):(3'h6)] & wire27[(3'h5):(1'h1)]) >= $signed($unsigned(wire6[(2'h2):(1'h1)])));
              reg31 <= (8'hb6);
              reg32 <= $signed((^~(!($signed(reg30) ?
                  (wire5 ^ (7'h40)) : $signed(wire7)))));
            end
          else
            begin
              reg30 <= $unsigned({$unsigned((wire4[(4'he):(4'h8)] == $unsigned(reg32)))});
            end
          reg33 <= $unsigned($signed(wire3));
          reg34 <= reg32[(2'h2):(1'h0)];
          reg35 <= {wire7[(3'h5):(3'h4)]};
        end
      else
        begin
          reg29 <= (~{($signed({wire3}) ?
                  ($signed(wire3) ?
                      $signed(wire28) : (wire1 >= (8'hb6))) : ((wire27 ?
                      wire27 : reg30) ~^ (wire0 ? wire2 : wire25))),
              reg32[(3'h6):(3'h6)]});
        end
      reg36 <= reg29[(2'h3):(1'h0)];
      reg37 <= {$unsigned($signed((^~wire4[(3'h5):(1'h0)])))};
      reg38 <= (reg30 > ((wire27 ?
          (reg31[(4'h9):(3'h4)] || wire5) : ((wire27 >>> reg29) ?
              $unsigned(reg29) : (~wire25))) || (!wire6[(1'h1):(1'h0)])));
      if ($signed($signed(reg35[(3'h6):(2'h3)])))
        begin
          if ((^$unsigned(wire4)))
            begin
              reg39 <= (+wire28[(4'hd):(1'h1)]);
              reg40 <= $signed(wire2);
            end
          else
            begin
              reg39 <= (reg30 ?
                  $signed(reg37[(4'ha):(4'h8)]) : ((^~reg33[(4'hc):(1'h1)]) || {$signed({wire5}),
                      (~^(reg37 << wire6))}));
              reg40 <= $unsigned(wire4[(4'he):(4'hc)]);
              reg41 <= (reg36[(3'h7):(3'h6)] ?
                  reg39 : ($signed($signed((wire2 ?
                      (8'hb6) : reg29))) > ($signed(wire6) ?
                      (wire28 ~^ (reg35 ? wire1 : reg39)) : reg32)));
            end
          if (($unsigned({$signed((reg35 || reg36)),
              reg31[(3'h6):(2'h3)]}) <= (^$signed(((reg39 ^ wire27) ~^ (wire2 ?
              reg31 : wire27))))))
            begin
              reg42 <= (reg32[(5'h13):(4'h9)] ?
                  wire7 : (^(|$unsigned((reg29 || wire25)))));
            end
          else
            begin
              reg42 <= reg42;
              reg43 <= ((~&(~&{wire5})) ?
                  (+((wire7[(4'hf):(4'h9)] << reg33) ?
                      ($unsigned(wire5) ?
                          wire27 : reg40[(3'h4):(3'h4)]) : $signed(((8'hb6) <= (7'h42))))) : reg29[(3'h5):(2'h3)]);
              reg44 <= $unsigned(reg40);
            end
          reg45 <= ($signed((reg37[(4'hc):(2'h2)] ?
              $signed((~reg43)) : $signed((reg39 ?
                  reg42 : (8'haa))))) == ((($signed(wire27) >> reg38[(1'h0):(1'h0)]) ?
              $signed($unsigned((8'ha7))) : reg34[(4'h8):(3'h7)]) || ($unsigned(reg44[(1'h0):(1'h0)]) ?
              (-$unsigned((8'ha3))) : ($signed((8'hbb)) ?
                  $unsigned(wire5) : (wire0 >>> reg44)))));
        end
      else
        begin
          reg39 <= $signed($signed(((~&(reg40 && reg29)) <= (reg41 << wire3[(2'h2):(2'h2)]))));
          reg40 <= $unsigned(({($unsigned(wire4) != $unsigned(wire25))} ?
              (((reg34 != wire28) ? $unsigned(reg41) : reg37[(1'h1):(1'h0)]) ?
                  ((reg38 >>> (8'hbb)) ?
                      reg30[(4'ha):(1'h1)] : reg36[(4'hd):(1'h1)]) : (&(8'h9e))) : reg36[(4'h9):(2'h3)]));
          reg41 <= reg30;
          reg42 <= (8'hac);
          reg43 <= $unsigned(reg29);
        end
    end
  assign wire46 = reg44[(3'h5):(2'h2)];
  module47 #() modinst63 (wire62, clk, wire25, wire5, reg30, wire1);
  module64 #() modinst143 (.clk(clk), .wire65(reg29), .wire68(wire27), .y(wire142), .wire66(wire6), .wire67(reg39), .wire69(reg32));
  always
    @(posedge clk) begin
      if (((&(^~(wire1 ?
          $unsigned(wire2) : $unsigned(wire46)))) * ((wire3[(2'h2):(1'h0)] | ($unsigned(reg38) ~^ (wire0 ?
              wire7 : wire7))) ?
          $signed($unsigned({reg34, wire5})) : $signed({{reg32, wire5},
              (8'had)}))))
        begin
          reg144 <= ((wire6 ?
              ((~^(wire46 ?
                  wire27 : wire25)) > reg44) : reg38[(3'h4):(1'h1)]) - wire2);
          reg145 <= reg41[(4'hb):(4'hb)];
          reg146 <= ((wire27[(4'hf):(3'h5)] * ($unsigned({wire27,
                  wire25}) & (~|reg40[(4'hd):(4'h8)]))) ?
              ($unsigned(((wire6 >= reg39) ? (~|reg40) : wire4)) ?
                  {wire27} : reg39[(4'hd):(1'h1)]) : ($unsigned(wire5) >= wire0));
          reg147 <= ((8'ha5) ?
              $unsigned((~|$signed(reg36[(4'hb):(3'h6)]))) : {wire46[(1'h0):(1'h0)],
                  $signed(($unsigned(reg39) > reg31))});
        end
      else
        begin
          reg144 <= (&((&(reg36 ?
              $unsigned(reg37) : ((8'ha4) && reg33))) ^~ reg44[(3'h4):(2'h2)]));
          reg145 <= {reg38};
        end
      reg148 <= {$unsigned({(wire3[(3'h7):(1'h0)] ?
                  (wire4 > reg34) : (~^wire62))}),
          (wire46[(3'h6):(1'h0)] ?
              wire25[(1'h0):(1'h0)] : wire7[(2'h3):(2'h2)])};
      reg149 <= (reg40[(3'h6):(3'h5)] ?
          wire4 : (reg38 ? $unsigned($signed($signed(reg144))) : (8'hbb)));
    end
  assign wire150 = (~^$signed(($signed((~&reg29)) ~^ (wire27[(4'h9):(3'h7)] * {reg144}))));
  assign wire151 = reg37[(4'hb):(3'h6)];
  assign wire152 = wire4;
  module153 #() modinst311 (wire310, clk, wire62, wire4, reg34, wire28, wire25);
  assign wire312 = reg41[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg313 <= {$unsigned(({(~|wire28), $signed((8'ha7))} && (&(8'hab))))};
    end
endmodule

module module153
#(parameter param308 = {((+{(~(8'ha6))}) && {(-(~^(8'hb8)))})}, 
parameter param309 = ((^param308) ? ((^(!(^~param308))) ? {param308} : (param308 ? ((param308 - param308) ? param308 : param308) : (^~(-param308)))) : ((^~(param308 < (&param308))) & (~|({param308, param308} * (param308 + (8'hbd)))))))
(y, clk, wire154, wire155, wire156, wire157, wire158);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire154;
  input wire [(4'he):(1'h0)] wire155;
  input wire [(5'h11):(1'h0)] wire156;
  input wire signed [(5'h14):(1'h0)] wire157;
  input wire [(4'hf):(1'h0)] wire158;
  wire [(3'h4):(1'h0)] wire307;
  wire [(4'he):(1'h0)] wire306;
  wire signed [(4'hc):(1'h0)] wire297;
  wire signed [(3'h6):(1'h0)] wire277;
  wire [(5'h15):(1'h0)] wire227;
  wire [(4'hc):(1'h0)] wire226;
  wire signed [(5'h14):(1'h0)] wire172;
  wire signed [(5'h10):(1'h0)] wire201;
  wire signed [(5'h13):(1'h0)] wire224;
  reg signed [(4'hd):(1'h0)] reg305 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg304 = (1'h0);
  reg signed [(4'he):(1'h0)] reg303 = (1'h0);
  reg [(5'h14):(1'h0)] reg302 = (1'h0);
  reg [(4'hc):(1'h0)] reg301 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg300 = (1'h0);
  reg [(4'hf):(1'h0)] reg299 = (1'h0);
  assign y = {wire307,
                 wire306,
                 wire297,
                 wire277,
                 wire227,
                 wire226,
                 wire172,
                 wire201,
                 wire224,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 (1'h0)};
  module159 #() modinst173 (.y(wire172), .wire161(wire158), .wire162(wire157), .wire160(wire155), .wire163(wire154), .clk(clk));
  module174 #() modinst202 (wire201, clk, wire156, wire154, wire158, wire155);
  module203 #() modinst225 (.y(wire224), .wire205(wire157), .wire207(wire201), .wire204(wire155), .wire208(wire156), .clk(clk), .wire206(wire172));
  assign wire226 = $signed(wire156[(4'ha):(3'h4)]);
  assign wire227 = wire156[(2'h3):(2'h3)];
  module228 #() modinst278 (wire277, clk, wire157, wire227, wire156, wire155);
  module279 #() modinst298 (.y(wire297), .clk(clk), .wire283(wire154), .wire280(wire227), .wire282(wire157), .wire281(wire201));
  always
    @(posedge clk) begin
      reg299 <= $signed(((&($unsigned(wire226) ^ wire201[(4'h9):(2'h2)])) == ($signed((wire297 ?
              wire157 : wire156)) ?
          $signed((^~wire155)) : ((wire226 || wire158) <<< $signed(wire277)))));
      if (wire172[(3'h5):(2'h3)])
        begin
          reg300 <= (~^wire224);
        end
      else
        begin
          reg300 <= (wire156 ?
              $unsigned((wire297 ?
                  wire157[(4'h8):(3'h6)] : wire277[(3'h6):(3'h6)])) : ($signed(wire157[(5'h11):(2'h3)]) ?
                  (reg299[(4'he):(4'ha)] ?
                      reg300[(5'h10):(3'h5)] : $signed((8'hbf))) : $unsigned(wire226)));
          reg301 <= (wire155[(4'hd):(3'h5)] ? wire156[(4'hc):(2'h2)] : wire156);
          reg302 <= (reg301 ?
              $unsigned($signed((wire158[(4'ha):(3'h4)] ?
                  ((8'hac) >> (8'hab)) : $signed(reg299)))) : wire226);
        end
      reg303 <= (+wire154);
      reg304 <= wire224[(4'hd):(3'h6)];
      reg305 <= (wire224[(4'h8):(3'h6)] - (~&(~&(8'h9e))));
    end
  assign wire306 = {wire156[(5'h11):(3'h6)]};
  assign wire307 = (8'ha8);
endmodule

module module64
#(parameter param141 = (-(((((8'ha1) || (8'haa)) & (^~(8'ha5))) ? (8'ha9) : ((+(8'ha8)) == (-(8'hbf)))) ? ((((8'hba) ^~ (8'ha9)) ? (~&(8'ha7)) : (^~(8'hbc))) ? (((8'had) ? (8'hac) : (8'ha8)) ? {(8'hb9), (8'haf)} : (^~(8'hac))) : (-((8'h9c) - (8'ha5)))) : (^(7'h40)))))
(y, clk, wire65, wire66, wire67, wire68, wire69);
  output wire [(32'h1a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire65;
  input wire signed [(3'h6):(1'h0)] wire66;
  input wire signed [(5'h11):(1'h0)] wire67;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire signed [(4'he):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire135;
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  assign y = {wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire135,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 (1'h0)};
  assign wire70 = $unsigned((&$unsigned(($unsigned(wire66) ?
                      (8'hab) : (wire65 <<< wire65)))));
  assign wire71 = (wire70 & wire69);
  assign wire72 = $signed(wire67[(4'hf):(4'ha)]);
  assign wire73 = $unsigned($unsigned(wire71));
  assign wire74 = $unsigned({$unsigned(wire70), wire68[(4'hf):(1'h0)]});
  assign wire75 = $unsigned(wire66);
  always
    @(posedge clk) begin
      reg76 <= (($unsigned((wire73[(4'h9):(3'h7)] <<< (|(8'hb7)))) == wire73[(4'hb):(3'h4)]) ?
          wire71[(1'h1):(1'h0)] : wire71[(1'h1):(1'h0)]);
      if ((($unsigned((((8'hbb) ? (8'hbc) : wire68) - $unsigned(wire72))) ?
          $signed(({(8'ha1)} ?
              $signed(wire71) : (wire67 ?
                  reg76 : reg76))) : wire72[(4'he):(2'h2)]) >> (~|(|$signed((wire73 ?
          wire65 : wire65))))))
        begin
          reg77 <= (wire74[(1'h0):(1'h0)] ?
              ({reg76} ?
                  ($signed((8'hac)) ?
                      (8'hac) : $unsigned(wire69)) : ($signed((wire68 ?
                          wire71 : wire72)) ?
                      {$signed(wire69),
                          $signed((8'h9e))} : $signed($signed((8'ha2))))) : {(8'hbc)});
          if (((^~(|$unsigned((wire74 ? reg76 : wire71)))) ^~ wire70))
            begin
              reg78 <= $unsigned(wire67);
              reg79 <= $signed(reg76[(1'h0):(1'h0)]);
              reg80 <= (wire71 >> $unsigned((|reg76)));
              reg81 <= reg76[(2'h3):(1'h1)];
            end
          else
            begin
              reg78 <= ({reg81} ?
                  $unsigned(wire67) : $unsigned((^wire69[(3'h4):(1'h1)])));
            end
        end
      else
        begin
          reg77 <= ((wire65 ?
              ((~&(wire72 ? wire65 : wire70)) ?
                  (reg77 << ((8'ha0) ?
                      wire67 : reg81)) : $unsigned(wire74)) : wire71[(1'h1):(1'h0)]) <= $signed((~^((!reg78) ?
              (!(8'hb3)) : wire75[(4'hd):(3'h5)]))));
          reg78 <= (reg77[(1'h0):(1'h0)] ^ wire72[(4'hc):(3'h7)]);
          reg79 <= $unsigned(((reg80[(3'h6):(3'h4)] ?
              $signed({reg80,
                  wire73}) : $unsigned($signed(reg79))) >>> (!reg79[(3'h4):(1'h0)])));
          reg80 <= wire71[(1'h0):(1'h0)];
        end
      reg82 <= wire67[(2'h3):(1'h0)];
    end
  assign wire83 = $signed($signed(($signed((~&(8'ha8))) <<< reg81)));
  assign wire84 = $signed((-(|(reg80[(3'h6):(3'h5)] ?
                      {wire69, wire65} : (7'h44)))));
  assign wire85 = reg79;
  assign wire86 = $signed((($signed($unsigned(wire83)) ?
                      $unsigned($unsigned(reg82)) : wire66) << {(8'hb7)}));
  assign wire87 = $signed(wire72);
  assign wire88 = (($unsigned({reg81[(4'h8):(1'h0)], $signed(wire69)}) ?
                      wire75 : (wire72[(4'h9):(4'h8)] ?
                          (~wire75) : wire75)) + (^($unsigned($signed(wire75)) ?
                      wire74 : wire70)));
  always
    @(posedge clk) begin
      if (wire67[(4'hc):(4'hc)])
        begin
          reg89 <= (^$signed((8'haa)));
          reg90 <= $signed(wire88[(3'h6):(1'h0)]);
        end
      else
        begin
          if (reg78[(1'h0):(1'h0)])
            begin
              reg89 <= $unsigned(reg78);
              reg90 <= $signed({((^(wire83 ? (8'hb3) : reg78)) ?
                      $signed($signed(reg81)) : {(&wire84), wire86}),
                  (({(8'hb8)} ? reg77[(1'h1):(1'h0)] : wire88) ?
                      (~&$unsigned(reg77)) : ((wire75 ? wire87 : reg82) ?
                          $signed((8'hab)) : ((8'hbd) * reg79)))});
              reg91 <= (!wire87);
            end
          else
            begin
              reg89 <= (8'hb0);
              reg90 <= ((wire88[(2'h2):(1'h1)] & (($signed(wire85) ?
                  reg78[(1'h0):(1'h0)] : wire85[(1'h1):(1'h0)]) || (~|{reg89}))) >= (wire68 ~^ wire87[(1'h0):(1'h0)]));
              reg91 <= ((((~^wire65[(4'ha):(3'h6)]) ?
                      ({wire86,
                          wire86} << {wire74}) : $signed($unsigned(wire66))) ~^ {$unsigned(wire67[(5'h11):(3'h6)]),
                      {reg79[(1'h0):(1'h0)]}}) ?
                  ({wire88} < $signed({(wire69 + reg76)})) : $unsigned(reg82[(2'h2):(1'h1)]));
            end
          reg92 <= (({reg90[(1'h1):(1'h0)], wire70} ?
              ($signed(((8'ha6) == reg81)) <<< $signed($unsigned(wire87))) : (&wire65[(4'ha):(1'h1)])) ^~ $unsigned((((8'hab) ?
              (reg79 ?
                  (8'ha2) : (8'hbc)) : (wire71 != wire71)) != (!(!reg79)))));
        end
      if ($unsigned(($signed($signed(reg92[(4'hc):(3'h4)])) ?
          $signed($signed((&wire88))) : reg81)))
        begin
          reg93 <= ({(^wire68[(4'h9):(4'h9)]),
                  $signed($unsigned($signed(wire84)))} ?
              ($signed($unsigned(reg78)) ?
                  (!(+(^~wire83))) : (^~((^~wire66) ?
                      $signed(reg76) : {reg77}))) : reg89[(3'h6):(1'h1)]);
        end
      else
        begin
          reg93 <= wire83;
          reg94 <= ((|$signed($unsigned((~&(8'hb2))))) ?
              wire69[(3'h6):(2'h2)] : (+(reg92[(3'h5):(2'h2)] ?
                  ({(8'ha8), wire86} ?
                      {wire66,
                          wire83} : $signed(wire73)) : wire70[(3'h7):(1'h1)])));
          reg95 <= ($unsigned(wire84) ?
              (~^$unsigned(($signed((8'hab)) <= (reg92 >= reg89)))) : $unsigned(((wire73 ?
                      reg90[(1'h0):(1'h0)] : ((8'ha5) ^~ reg89)) ?
                  $signed({reg89, reg78}) : {$unsigned(wire86),
                      $unsigned(wire84)})));
          if (wire85)
            begin
              reg96 <= (-reg94[(2'h3):(2'h3)]);
              reg97 <= wire84;
            end
          else
            begin
              reg96 <= wire72[(5'h13):(5'h11)];
              reg97 <= reg79[(1'h0):(1'h0)];
              reg98 <= $unsigned(wire87[(3'h7):(1'h1)]);
            end
        end
      reg99 <= wire67[(2'h3):(1'h1)];
      reg100 <= ({($unsigned((-wire86)) << (|(8'hac)))} ?
          {reg96, reg80[(3'h6):(3'h6)]} : reg80[(2'h2):(1'h1)]);
    end
  module101 #() modinst136 (wire135, clk, wire67, reg98, wire87, wire69);
  always
    @(posedge clk) begin
      reg137 <= reg77;
      reg138 <= $unsigned((wire66 ? $signed(wire72) : wire67[(1'h1):(1'h0)]));
      reg139 <= (&{((wire86 >= $unsigned(wire84)) >>> $unsigned({wire85})),
          (~&(&((8'hb2) << (8'hbf))))});
      reg140 <= $unsigned(wire87[(5'h12):(5'h10)]);
    end
endmodule

module module47  (y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire51;
  input wire [(4'h9):(1'h0)] wire50;
  input wire [(4'he):(1'h0)] wire49;
  input wire signed [(5'h12):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire49)
        begin
          reg52 <= $unsigned((8'hb2));
          if ((wire51 + {$signed(wire50[(3'h7):(1'h1)])}))
            begin
              reg53 <= {(8'hb6)};
              reg54 <= (($unsigned(wire49[(3'h7):(3'h6)]) || reg53) != (wire49 + reg53[(2'h2):(1'h1)]));
            end
          else
            begin
              reg53 <= wire49;
              reg54 <= {(~^wire49),
                  $signed(($signed(reg54) ? $signed((|(8'h9f))) : (^(8'ha7))))};
              reg55 <= (+((~&wire49) ?
                  wire48[(5'h11):(3'h4)] : $unsigned((~&wire51[(4'h8):(1'h1)]))));
              reg56 <= (&$unsigned($unsigned($signed(reg52[(3'h5):(1'h0)]))));
            end
        end
      else
        begin
          reg52 <= reg55[(3'h6):(3'h5)];
          reg53 <= (({$signed((+reg55)),
                  wire51[(4'h8):(1'h1)]} >>> reg56[(1'h0):(1'h0)]) ?
              $signed($signed(($signed(wire48) ?
                  wire49[(2'h3):(1'h0)] : wire50[(4'h8):(4'h8)]))) : $unsigned(reg53[(3'h6):(2'h3)]));
        end
      reg57 <= {reg52[(4'ha):(4'ha)]};
    end
  assign wire58 = $unsigned($unsigned(((((8'ha6) | (8'hb5)) >= $unsigned(reg53)) && reg52[(4'he):(3'h6)])));
  assign wire59 = {wire48[(4'hb):(4'h9)]};
  assign wire60 = ((!(+(+(reg53 ^~ wire48)))) ?
                      ((reg53[(3'h7):(3'h7)] + $signed({(8'hb9)})) && (~&$unsigned((~^wire50)))) : {(^~($unsigned((8'ha9)) ?
                              (~wire59) : $signed(reg54)))});
  assign wire61 = $unsigned((({$signed(reg55), reg57[(3'h4):(1'h1)]} ?
                      wire50[(3'h5):(2'h2)] : ($signed(reg57) << $signed(wire58))) >= reg54[(4'h8):(3'h4)]));
endmodule

module module8
#(parameter param23 = (^~(8'hb5)), 
parameter param24 = param23)
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire [(3'h7):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  assign y = {wire22,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg21,
                 reg20,
                 reg19,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= $unsigned($signed((^~$unsigned($unsigned(wire10)))));
    end
  assign wire15 = wire10[(1'h0):(1'h0)];
  assign wire16 = $signed($signed(((!wire15[(4'h9):(3'h4)]) ?
                      wire11 : $unsigned((8'ha2)))));
  assign wire17 = reg14;
  assign wire18 = $unsigned(($signed(wire15[(4'hc):(1'h0)]) >= $signed((wire13[(4'h9):(4'h9)] ?
                      {wire13, wire17} : (-wire13)))));
  always
    @(posedge clk) begin
      reg19 <= {reg14[(4'h8):(3'h6)],
          $unsigned($signed(wire11[(2'h2):(1'h0)]))};
      reg20 <= wire18[(2'h3):(1'h1)];
      reg21 <= (((~($signed((8'hb5)) ?
          $signed(wire13) : (^reg20))) | $unsigned((wire15 ^ {(8'ha9)}))) || wire10);
    end
  assign wire22 = $unsigned(wire16[(1'h1):(1'h1)]);
endmodule

module module101
#(parameter param134 = ({(|(~(~&(8'hbd))))} + ((((~|(8'ha7)) + (^(8'h9d))) - (-((7'h41) * (8'ha4)))) > (({(8'hbf), (8'hae)} ? {(8'h9f)} : {(8'haa)}) ? {((8'hb8) == (8'hbf))} : (&{(8'hb2), (8'hb3)})))))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire105;
  input wire [(2'h2):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire103;
  input wire signed [(4'he):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire126,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg129,
                 reg128,
                 reg127,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire106 = wire103;
  assign wire107 = ((wire102 ~^ ({(wire103 ? (8'h9d) : (8'had))} > ((8'ha0) ?
                       wire103 : $unsigned(wire105)))) ~^ wire103);
  assign wire108 = (((((wire102 | wire103) ?
                               wire105[(1'h0):(1'h0)] : wire102[(4'hb):(1'h0)]) ?
                           {$signed(wire103),
                               (wire107 <<< wire107)} : ((8'ha3) ?
                               wire107 : ((8'hb1) <<< wire103))) ?
                       wire105 : wire105[(3'h5):(3'h5)]) ^~ wire102[(2'h3):(2'h2)]);
  assign wire109 = ($unsigned((~|(&wire102[(4'hc):(1'h1)]))) & ((+(~wire107)) <= $signed(wire105)));
  assign wire110 = (|wire109);
  assign wire111 = {$signed(wire107[(5'h10):(4'ha)])};
  assign wire112 = (^wire107[(4'h9):(2'h3)]);
  assign wire113 = wire107;
  assign wire114 = $unsigned($unsigned((wire102[(2'h2):(1'h0)] < $signed($signed(wire113)))));
  assign wire115 = (~^wire103);
  always
    @(posedge clk) begin
      if ((({((wire105 <= wire109) ^~ (~wire104)), (8'ha4)} ?
          wire105[(1'h1):(1'h1)] : ($unsigned(wire107[(3'h5):(3'h4)]) && ({wire107} == (&wire115)))) ^~ wire104[(2'h2):(1'h0)]))
        begin
          if (wire107[(4'hf):(1'h0)])
            begin
              reg116 <= $unsigned($signed(wire108[(1'h0):(1'h0)]));
              reg117 <= wire108[(1'h1):(1'h0)];
            end
          else
            begin
              reg116 <= wire104;
              reg117 <= (~|({$unsigned(wire115[(1'h0):(1'h0)]),
                      ((|wire103) ? $unsigned(reg117) : (^~(8'ha3)))} ?
                  $signed(((wire112 ?
                      (7'h41) : wire113) ^~ (wire113 && wire113))) : (!wire102)));
              reg118 <= wire113;
              reg119 <= (-{(($signed(reg118) >= (8'ha6)) ?
                      $signed($unsigned(reg118)) : $unsigned(wire109[(4'h9):(4'h8)])),
                  $unsigned({$unsigned(wire114), wire111[(3'h4):(2'h2)]})});
              reg120 <= (wire108[(4'h8):(4'h8)] ?
                  $signed((&(wire102 == (wire105 ?
                      wire110 : wire105)))) : (~&(&((wire102 << wire110) ?
                      (wire109 ? wire107 : wire103) : (8'ha2)))));
            end
          reg121 <= reg119;
        end
      else
        begin
          reg116 <= (+{reg121});
          if (($signed({$unsigned((reg121 ? reg116 : reg117)),
                  ((wire114 != wire105) ^ wire102[(3'h7):(3'h5)])}) ?
              ((~$unsigned(reg121)) ?
                  wire110 : ((~&{(7'h42),
                      (8'hbb)}) >> ((7'h43) ^~ wire113[(3'h7):(2'h2)]))) : {(($signed(reg118) >> $signed((8'h9f))) == ($signed((8'hbf)) ?
                      wire112 : $signed(reg120)))}))
            begin
              reg117 <= (wire114 ?
                  (~^(~(~|$unsigned(wire108)))) : ($signed({wire105}) == $signed((wire110 & (!reg120)))));
              reg118 <= (~$unsigned(wire114));
              reg119 <= (^~$unsigned($signed((wire105[(1'h1):(1'h0)] >> $signed(wire111)))));
              reg120 <= (wire104[(2'h2):(1'h1)] ?
                  ($signed((~^wire113[(2'h3):(2'h3)])) ~^ (reg119 >= ((wire108 ?
                      wire106 : (8'ha8)) >> (&reg117)))) : (~|(~(wire115[(3'h7):(2'h2)] ?
                      $signed(wire113) : $unsigned(wire113)))));
              reg121 <= wire103[(5'h13):(4'hf)];
            end
          else
            begin
              reg117 <= ((!(~|({wire103,
                  (8'hab)} << (reg117 != wire111)))) & {wire112[(4'h8):(3'h7)],
                  {(reg118[(3'h7):(2'h3)] | (wire114 >>> wire106))}});
            end
        end
      reg122 <= $unsigned(((wire107 ? (8'hb5) : wire110[(4'hb):(4'h9)]) ?
          $signed($unsigned(((8'ha1) ? wire115 : wire105))) : wire105));
      reg123 <= (-$signed(((~&(reg120 ? wire110 : reg122)) ?
          wire113[(3'h5):(3'h4)] : {(wire109 ^~ (8'ha1)), $signed(wire102)})));
      reg124 <= (($unsigned(reg116[(1'h1):(1'h0)]) ?
              (wire115 < $signed((reg117 - wire115))) : wire107[(3'h5):(1'h1)]) ?
          $signed((~&(~&wire108[(3'h6):(3'h4)]))) : wire104);
      reg125 <= (8'h9c);
    end
  assign wire126 = (~|reg116);
  always
    @(posedge clk) begin
      reg127 <= $unsigned({{{((8'h9c) == reg121)}},
          $signed(wire109[(3'h4):(2'h2)])});
      reg128 <= ((8'hb4) ? reg123 : (~wire107));
      reg129 <= reg128;
    end
  assign wire130 = (~(~^$unsigned((-wire113))));
  assign wire131 = ($unsigned(($unsigned(wire114[(2'h3):(2'h3)]) ?
                       (8'ha2) : wire115[(3'h5):(1'h1)])) ~^ $unsigned((^~wire108[(5'h11):(4'h9)])));
  assign wire132 = $signed((^(8'haf)));
  assign wire133 = ($signed(wire110) ?
                       (wire103[(3'h5):(1'h1)] ?
                           $signed((wire132[(1'h0):(1'h0)] ?
                               (reg121 | wire106) : (wire113 || wire106))) : $signed($signed({reg124}))) : $signed($signed($unsigned((reg120 ?
                           reg121 : reg117)))));
endmodule

module module279
#(parameter param295 = (~|((~(((8'hab) ? (8'ha6) : (7'h42)) <= (^~(8'hbc)))) || (~&(8'ha0)))), 
parameter param296 = {{param295, param295}})
(y, clk, wire283, wire282, wire281, wire280);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire283;
  input wire [(4'hd):(1'h0)] wire282;
  input wire [(4'hd):(1'h0)] wire281;
  input wire signed [(4'ha):(1'h0)] wire280;
  wire [(2'h3):(1'h0)] wire294;
  wire [(3'h6):(1'h0)] wire293;
  wire signed [(5'h13):(1'h0)] wire292;
  wire signed [(5'h10):(1'h0)] wire286;
  wire signed [(4'h9):(1'h0)] wire284;
  reg signed [(2'h3):(1'h0)] reg291 = (1'h0);
  reg [(2'h2):(1'h0)] reg290 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg289 = (1'h0);
  reg [(4'hb):(1'h0)] reg288 = (1'h0);
  reg signed [(4'he):(1'h0)] reg287 = (1'h0);
  reg [(3'h5):(1'h0)] reg285 = (1'h0);
  assign y = {wire294,
                 wire293,
                 wire292,
                 wire286,
                 wire284,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg285,
                 (1'h0)};
  assign wire284 = (((wire283[(4'h8):(1'h1)] ?
                               $signed($unsigned(wire283)) : $signed((~wire280))) ?
                           ($unsigned($unsigned(wire282)) ?
                               $signed($signed(wire283)) : wire280) : wire282[(3'h4):(2'h2)]) ?
                       {wire283, wire283[(4'hb):(3'h7)]} : wire280);
  always
    @(posedge clk) begin
      reg285 <= wire283;
    end
  assign wire286 = (wire284[(2'h2):(1'h0)] > $unsigned($signed($unsigned((wire280 ?
                       wire283 : wire281)))));
  always
    @(posedge clk) begin
      reg287 <= (^~wire283);
      reg288 <= wire283[(2'h3):(1'h1)];
      reg289 <= wire282[(3'h6):(3'h5)];
      reg290 <= reg289[(4'hb):(1'h0)];
      reg291 <= (~&(reg289 ?
          ((wire281[(1'h1):(1'h1)] ? reg289 : $signed(wire286)) ?
              (|wire282[(4'hb):(1'h1)]) : wire284[(3'h6):(1'h1)]) : reg285[(1'h1):(1'h0)]));
    end
  assign wire292 = $signed(((+(~((8'had) ? reg290 : wire282))) ?
                       ((&reg291[(2'h2):(2'h2)]) ?
                           $signed($unsigned(wire286)) : $signed((reg287 ^ reg285))) : reg285));
  assign wire293 = wire281;
  assign wire294 = $unsigned($unsigned($signed($unsigned((wire292 ~^ wire281)))));
endmodule

module module228
#(parameter param276 = {(8'hb4)})
(y, clk, wire232, wire231, wire230, wire229);
  output wire [(32'h21b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire232;
  input wire signed [(5'h15):(1'h0)] wire231;
  input wire signed [(4'hd):(1'h0)] wire230;
  input wire [(4'hb):(1'h0)] wire229;
  wire signed [(4'hc):(1'h0)] wire249;
  wire [(4'hc):(1'h0)] wire248;
  wire [(5'h12):(1'h0)] wire247;
  wire signed [(5'h15):(1'h0)] wire246;
  wire signed [(4'ha):(1'h0)] wire245;
  wire [(4'ha):(1'h0)] wire244;
  wire [(5'h12):(1'h0)] wire243;
  wire signed [(5'h13):(1'h0)] wire242;
  wire [(5'h14):(1'h0)] wire241;
  wire [(4'hc):(1'h0)] wire240;
  wire [(4'hf):(1'h0)] wire239;
  wire signed [(5'h11):(1'h0)] wire238;
  wire signed [(4'hf):(1'h0)] wire237;
  wire signed [(4'hd):(1'h0)] wire236;
  wire [(4'he):(1'h0)] wire235;
  wire signed [(4'hd):(1'h0)] wire234;
  wire signed [(5'h11):(1'h0)] wire233;
  reg [(2'h3):(1'h0)] reg275 = (1'h0);
  reg [(5'h11):(1'h0)] reg274 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg273 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg272 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg271 = (1'h0);
  reg [(4'hf):(1'h0)] reg270 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg269 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg268 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg267 = (1'h0);
  reg [(3'h5):(1'h0)] reg266 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg265 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg264 = (1'h0);
  reg [(4'hb):(1'h0)] reg263 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg262 = (1'h0);
  reg [(4'hb):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg260 = (1'h0);
  reg [(4'hc):(1'h0)] reg259 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg258 = (1'h0);
  reg [(2'h2):(1'h0)] reg257 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg256 = (1'h0);
  reg [(5'h10):(1'h0)] reg255 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg254 = (1'h0);
  reg signed [(4'he):(1'h0)] reg253 = (1'h0);
  reg [(3'h6):(1'h0)] reg252 = (1'h0);
  reg [(5'h15):(1'h0)] reg251 = (1'h0);
  reg [(5'h11):(1'h0)] reg250 = (1'h0);
  assign y = {wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire241,
                 wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 (1'h0)};
  assign wire233 = (((wire230[(3'h4):(1'h0)] ?
                       wire229 : (^~wire232)) <<< ({(wire229 ?
                               (8'ha0) : wire232)} ?
                       {(wire232 ? wire232 : wire230),
                           (&(8'hba))} : wire232)) >> (wire232 && wire230));
  assign wire234 = wire231[(4'hf):(1'h1)];
  assign wire235 = wire230[(1'h1):(1'h0)];
  assign wire236 = $unsigned(wire233[(4'hc):(4'ha)]);
  assign wire237 = (!wire229);
  assign wire238 = ($signed($unsigned(wire237)) <<< wire231[(1'h1):(1'h0)]);
  assign wire239 = (((^$unsigned((wire230 - wire229))) ?
                       wire235 : (8'haf)) > wire235[(4'hb):(1'h0)]);
  assign wire240 = (wire239[(3'h6):(1'h0)] ?
                       (({$signed(wire238)} >= wire236) || ($unsigned({wire239}) ~^ $signed((wire234 < (8'hb6))))) : {wire229[(4'h8):(4'h8)]});
  assign wire241 = {(^~(({wire239} & wire232[(4'hb):(1'h0)]) ~^ (~&wire229[(1'h1):(1'h1)])))};
  assign wire242 = (+$unsigned((&wire238)));
  assign wire243 = ({wire236,
                       ($signed(wire240[(4'h8):(1'h0)]) + {((8'ha7) >>> wire232)})} > {wire240[(4'h8):(4'h8)]});
  assign wire244 = $unsigned($unsigned((-((^~wire234) ?
                       {wire231, wire233} : wire234[(2'h3):(1'h0)]))));
  assign wire245 = $unsigned((wire235 ?
                       $unsigned(($signed(wire244) ?
                           wire244 : $unsigned(wire234))) : wire233));
  assign wire246 = ($unsigned(wire232) ~^ $signed({wire235}));
  assign wire247 = (&({(wire229[(1'h1):(1'h0)] ^ wire235[(3'h4):(3'h4)])} ?
                       ({$signed(wire230)} ?
                           $unsigned($unsigned(wire234)) : wire230[(3'h6):(2'h3)]) : $unsigned((wire237[(4'hd):(1'h0)] >> {(8'ha2)}))));
  assign wire248 = wire244[(3'h7):(2'h2)];
  assign wire249 = {$unsigned($unsigned($signed(wire234[(4'hc):(4'ha)]))),
                       (wire235[(1'h0):(1'h0)] ?
                           wire229 : wire231[(4'h8):(3'h4)])};
  always
    @(posedge clk) begin
      reg250 <= ($unsigned((wire233[(3'h5):(3'h4)] ?
              (^~(-wire246)) : wire243)) ?
          (~$signed(wire233[(3'h6):(1'h1)])) : $unsigned(({(wire247 != wire249),
              wire240} >>> wire234)));
      if ($signed((wire239[(2'h3):(1'h0)] <<< {(~|(wire231 ?
              wire241 : wire248))})))
        begin
          if (wire229)
            begin
              reg251 <= (($unsigned((wire237 ? (8'h9f) : $signed(wire241))) ?
                      $unsigned(($unsigned(wire245) ?
                          (wire249 < wire239) : wire230[(4'hd):(4'hc)])) : ($unsigned((^reg250)) ?
                          (8'h9c) : {$unsigned(wire240),
                              (wire229 <= wire246)})) ?
                  (^~{wire229, (wire248 ^ $unsigned(wire240))}) : (^(({(8'ha6),
                              wire245} ?
                          $signed(wire235) : wire248[(3'h5):(3'h5)]) ?
                      ($unsigned(wire244) > (!wire248)) : wire246)));
              reg252 <= (^~(-wire249[(3'h6):(1'h0)]));
              reg253 <= {($unsigned($unsigned($signed(wire243))) >>> ($signed(wire246) >>> {wire231,
                      (wire246 && wire237)})),
                  ({wire243[(3'h6):(1'h0)], {(wire242 < wire244), wire229}} ?
                      $signed($unsigned(wire237[(4'he):(3'h4)])) : (wire246 ?
                          ($unsigned(wire248) ?
                              (wire229 >= wire242) : $unsigned(wire241)) : (((8'ha5) ?
                                  wire232 : wire240) ?
                              (wire231 ? wire232 : (8'hb3)) : wire235)))};
              reg254 <= wire238;
            end
          else
            begin
              reg251 <= ($signed((wire231 ?
                  (reg252[(3'h6):(3'h4)] ?
                      $unsigned((8'hb8)) : reg250[(5'h11):(1'h1)]) : (+wire248[(1'h1):(1'h1)]))) >> {$signed(wire229[(3'h4):(2'h2)]),
                  (~^$signed((wire229 ? reg253 : wire233)))});
              reg252 <= $unsigned(({wire246[(3'h6):(1'h1)],
                      (!$signed(reg251))} ?
                  (((wire239 ? wire244 : reg252) ?
                          $unsigned(wire242) : (~wire238)) ?
                      wire248 : wire236[(4'hb):(3'h5)]) : wire243[(3'h4):(3'h4)]));
              reg253 <= (wire248[(1'h1):(1'h0)] ?
                  wire242[(4'hd):(2'h2)] : $unsigned((wire249 != ((-wire232) ?
                      (wire248 * wire240) : (~reg252)))));
              reg254 <= $signed(wire240);
            end
          if ($signed(($signed(reg252[(2'h2):(1'h1)]) ?
              wire242 : $signed(wire237))))
            begin
              reg255 <= $unsigned((~&{$signed(wire242[(2'h2):(1'h1)]),
                  ((wire245 ? wire245 : reg252) ? {wire240} : (7'h41))}));
              reg256 <= wire237;
              reg257 <= {wire231};
              reg258 <= $unsigned($signed((reg253 | wire233)));
            end
          else
            begin
              reg255 <= $unsigned($unsigned(wire245[(3'h6):(2'h2)]));
              reg256 <= (($unsigned((!(wire238 && wire248))) ?
                  wire245 : $unsigned({$signed((8'h9e))})) || (~&(~^((|wire239) ?
                  reg253[(4'hb):(4'h8)] : $signed(wire233)))));
              reg257 <= reg250[(4'h9):(1'h0)];
              reg258 <= wire242;
            end
          if ($unsigned(reg251[(4'h8):(4'h8)]))
            begin
              reg259 <= reg253[(2'h2):(1'h0)];
              reg260 <= ((({(reg256 ^ wire242),
                          $signed((8'hb2))} * wire237[(2'h3):(2'h3)]) ?
                      wire245 : (+reg251)) ?
                  wire243 : ($unsigned($unsigned((~^wire243))) <<< {reg256[(4'hb):(3'h6)],
                      reg253}));
            end
          else
            begin
              reg259 <= (8'ha1);
              reg260 <= $unsigned(($signed($signed(wire246)) ?
                  wire247[(4'hc):(4'ha)] : wire239[(4'hb):(3'h6)]));
              reg261 <= wire246;
              reg262 <= reg250;
              reg263 <= (8'hac);
            end
          reg264 <= (((((-wire235) ? reg260 : (8'haf)) ?
                  reg254[(3'h4):(2'h2)] : ((reg253 | reg252) & (reg252 < reg250))) ?
              $unsigned($unsigned($signed(wire245))) : $unsigned(({wire243,
                      wire249} ?
                  (+wire243) : (^~(8'ha9))))) ^ wire230[(3'h5):(3'h4)]);
          reg265 <= (~|({$signed(reg263[(3'h7):(3'h7)]), wire245} ^ (8'hbb)));
        end
      else
        begin
          if ($unsigned(($signed(wire238[(4'he):(4'he)]) ?
              ($signed(wire240[(1'h1):(1'h0)]) <<< (7'h40)) : reg256[(4'ha):(4'ha)])))
            begin
              reg251 <= $unsigned(wire242[(5'h11):(4'he)]);
              reg252 <= {$signed($signed($signed((~&reg255))))};
              reg253 <= {(~^wire238), $unsigned(wire229)};
            end
          else
            begin
              reg251 <= ($unsigned((|$signed((~&(8'hae))))) ?
                  (wire244[(1'h0):(1'h0)] ?
                      (reg257 == wire246[(4'hd):(2'h2)]) : (~|$unsigned(reg254))) : (~&reg253));
              reg252 <= $unsigned(wire240);
              reg253 <= (~|(((+reg250[(3'h5):(2'h2)]) ?
                      {(reg259 != wire238)} : {wire232}) ?
                  wire243 : $signed((+$unsigned(wire248)))));
            end
          if ((~^$signed(reg256)))
            begin
              reg254 <= (reg255[(4'ha):(1'h0)] ?
                  (+reg253[(3'h7):(3'h7)]) : (wire240[(3'h4):(3'h4)] < $signed(wire229[(2'h3):(1'h0)])));
              reg255 <= (-reg265[(4'h9):(2'h2)]);
              reg256 <= $signed($signed($signed($signed($signed(reg259)))));
              reg257 <= $signed({$unsigned(((reg251 ?
                      (7'h41) : reg258) + wire246))});
            end
          else
            begin
              reg254 <= (8'hb3);
              reg255 <= reg259[(1'h1):(1'h0)];
              reg256 <= {reg253, wire244};
            end
          reg258 <= (wire232[(5'h11):(3'h4)] & reg263);
          reg259 <= wire234;
          reg260 <= reg253;
        end
    end
  always
    @(posedge clk) begin
      if ((((wire248 ?
                  reg257[(1'h1):(1'h0)] : {$unsigned(wire238),
                      (wire233 || reg256)}) ?
              (~^reg259[(4'ha):(3'h7)]) : $unsigned((8'ha7))) ?
          $signed((reg263 + ((wire244 ? reg255 : (8'ha6)) ?
              reg256[(2'h2):(1'h1)] : (~|reg265)))) : {($signed((wire246 ?
                  wire230 : wire245)) != ((reg265 << reg264) < wire233))}))
        begin
          reg266 <= (8'ha5);
          reg267 <= {wire238[(3'h5):(1'h0)], (~$signed((&$unsigned(reg259))))};
          reg268 <= ($signed(({{reg257},
              $unsigned((8'had))} ~^ (&$unsigned(reg264)))) ^~ $signed(wire233));
          if ((7'h41))
            begin
              reg269 <= {{wire230, (|(&reg254[(2'h2):(1'h0)]))}};
              reg270 <= ((&((+(~reg266)) && ($signed(reg261) * ((8'hb2) ^ wire239)))) | $signed(reg259));
              reg271 <= (&(((-(reg252 ? reg266 : wire238)) ?
                  $unsigned((wire233 ?
                      reg254 : wire240)) : (reg255 << $signed(wire249))) | ((~&(wire230 ?
                      (8'hb7) : reg270)) ?
                  (wire232[(4'hf):(2'h2)] ?
                      reg266 : $unsigned((8'h9c))) : ((reg266 ?
                          (8'ha3) : (8'ha8)) ?
                      $unsigned(reg256) : (8'hb7)))));
              reg272 <= $unsigned(wire237[(3'h4):(1'h1)]);
              reg273 <= (($unsigned($signed($unsigned(reg254))) <= (+(-reg259[(4'h8):(4'h8)]))) != wire235[(1'h1):(1'h0)]);
            end
          else
            begin
              reg269 <= (reg256[(4'he):(1'h1)] | reg272);
              reg270 <= wire241;
            end
        end
      else
        begin
          reg266 <= ((reg262 & wire243[(3'h5):(2'h3)]) != reg270[(4'h9):(4'h9)]);
          reg267 <= {($signed($unsigned((wire242 ?
                  reg253 : reg263))) & wire242[(4'h8):(2'h3)])};
          if ($unsigned(reg264[(4'hb):(4'h9)]))
            begin
              reg268 <= (((^$signed(wire230)) * $unsigned({(~^reg267),
                      (~^wire231)})) ?
                  $unsigned(($unsigned(((8'hae) ?
                      wire235 : wire234)) | ((wire230 || wire229) ?
                      $unsigned(reg252) : $unsigned(reg258)))) : wire241);
              reg269 <= ((($unsigned(wire232) ?
                  $unsigned((^(8'ha5))) : ($unsigned(reg263) - reg256[(1'h1):(1'h0)])) ^ reg260[(3'h7):(1'h1)]) <<< wire239);
              reg270 <= (8'hb8);
            end
          else
            begin
              reg268 <= reg265[(3'h4):(1'h1)];
            end
          reg271 <= ((!(((!reg270) + (~^wire241)) ^~ ((~(8'ha7)) >= (reg257 - reg254)))) ^~ ((&reg273) ^ $unsigned((~^reg257))));
          reg272 <= wire243;
        end
      reg274 <= {wire244};
      reg275 <= (reg264 ?
          (~wire233[(1'h0):(1'h0)]) : ((reg268[(3'h4):(2'h3)] ?
                  ((reg262 ? (8'had) : (8'ha6)) >> {wire242,
                      wire239}) : ((wire234 | wire235) ?
                      $unsigned(reg269) : wire248[(2'h2):(2'h2)])) ?
              $unsigned(reg269) : $signed(((^wire242) < (wire243 >= reg255)))));
    end
endmodule

module module203
#(parameter param223 = ((~({(~|(8'hb3))} ? (((8'hb1) ? (7'h42) : (8'hac)) * (~^(8'hb2))) : {((8'h9d) != (8'hab))})) ? ((8'ha8) && {(((8'ha8) ? (8'hbc) : (8'ha1)) ? (^(8'had)) : (|(8'hbb))), (+((8'ha2) >> (8'had)))}) : (~|({{(8'hab)}, ((8'hb8) - (8'hbb))} ? ({(8'ha0)} ? ((8'hbb) ? (8'hbf) : (8'hac)) : ((8'hb5) ? (8'hbe) : (8'hbd))) : {(-(8'hb4)), {(8'ha3), (7'h42)}}))))
(y, clk, wire208, wire207, wire206, wire205, wire204);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire208;
  input wire signed [(5'h10):(1'h0)] wire207;
  input wire signed [(5'h12):(1'h0)] wire206;
  input wire [(5'h11):(1'h0)] wire205;
  input wire [(4'he):(1'h0)] wire204;
  wire [(5'h14):(1'h0)] wire222;
  wire signed [(4'hf):(1'h0)] wire221;
  wire signed [(2'h3):(1'h0)] wire220;
  wire [(2'h2):(1'h0)] wire219;
  wire signed [(4'he):(1'h0)] wire218;
  wire signed [(3'h4):(1'h0)] wire217;
  wire signed [(3'h4):(1'h0)] wire216;
  wire signed [(5'h14):(1'h0)] wire215;
  wire [(5'h12):(1'h0)] wire214;
  wire [(4'he):(1'h0)] wire213;
  wire [(4'h8):(1'h0)] wire212;
  wire [(2'h3):(1'h0)] wire211;
  reg signed [(2'h2):(1'h0)] reg210 = (1'h0);
  reg [(5'h10):(1'h0)] reg209 = (1'h0);
  assign y = {wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 reg210,
                 reg209,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg209 <= {(!{$signed(((8'hab) ? wire208 : wire206))})};
      reg210 <= (~&$unsigned($signed($signed(wire207[(3'h5):(1'h1)]))));
    end
  assign wire211 = $unsigned($unsigned({((^~wire204) && $unsigned(wire206))}));
  assign wire212 = $signed(wire205);
  assign wire213 = ((wire205 && wire207[(4'hb):(3'h5)]) || reg210);
  assign wire214 = $signed($signed(wire204[(4'hc):(4'ha)]));
  assign wire215 = wire211;
  assign wire216 = reg209[(4'h8):(3'h4)];
  assign wire217 = $unsigned((^$signed(reg209)));
  assign wire218 = (-$unsigned($signed((-$unsigned(wire215)))));
  assign wire219 = ($signed(wire206) >= (!wire208));
  assign wire220 = $unsigned($signed($signed({(wire204 ? (8'hb1) : wire216),
                       wire213[(4'hd):(4'hb)]})));
  assign wire221 = $signed((-((((8'hb2) ? wire212 : wire211) ?
                       wire215 : (wire217 ?
                           wire205 : wire204)) - $signed($unsigned(wire213)))));
  assign wire222 = (($unsigned($signed($signed(wire204))) & $signed(((reg209 ?
                               wire220 : wire204) ?
                           reg209 : wire219))) ?
                       $unsigned(({reg209[(4'h8):(3'h6)]} * ((-reg209) >>> (wire208 ?
                           wire208 : (8'hb6))))) : (!((wire215 ?
                           (~&wire212) : (wire211 < reg210)) ^ wire207[(4'hc):(4'ha)])));
endmodule

module module174  (y, clk, wire178, wire177, wire176, wire175);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire178;
  input wire [(4'h9):(1'h0)] wire177;
  input wire signed [(4'h9):(1'h0)] wire176;
  input wire signed [(4'h8):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire197;
  wire signed [(3'h7):(1'h0)] wire196;
  wire signed [(5'h13):(1'h0)] wire195;
  wire [(4'hb):(1'h0)] wire193;
  wire signed [(3'h7):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire191;
  wire [(5'h12):(1'h0)] wire190;
  wire [(4'hf):(1'h0)] wire189;
  wire [(4'hd):(1'h0)] wire183;
  wire signed [(5'h12):(1'h0)] wire182;
  wire [(4'ha):(1'h0)] wire181;
  wire [(4'hc):(1'h0)] wire180;
  wire signed [(5'h12):(1'h0)] wire179;
  reg [(4'h9):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg187 = (1'h0);
  reg [(4'hc):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(5'h14):(1'h0)] reg184 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire195,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 reg200,
                 reg199,
                 reg198,
                 reg194,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 (1'h0)};
  assign wire179 = wire177;
  assign wire180 = $signed($unsigned((wire177 ? wire179 : wire177)));
  assign wire181 = ($signed($unsigned(($unsigned(wire175) > (~^wire180)))) < {wire177,
                       (-($unsigned(wire179) <= ((7'h40) | wire175)))});
  assign wire182 = ($unsigned($unsigned(wire176[(3'h4):(1'h0)])) == wire177);
  assign wire183 = $signed($signed($unsigned(wire177)));
  always
    @(posedge clk) begin
      reg184 <= (wire183 ^ (((wire175[(3'h4):(2'h3)] ?
          ((8'h9e) ?
              (8'h9d) : wire182) : {wire178}) <<< {$unsigned((7'h43))}) == wire183[(3'h7):(2'h2)]));
      reg185 <= (wire183 <= $unsigned(({(wire177 ? wire177 : wire183),
              (wire176 ? wire175 : wire181)} ?
          wire178 : wire182)));
      reg186 <= reg184[(3'h4):(1'h1)];
      reg187 <= $signed(wire183);
      reg188 <= (-$unsigned((reg184[(3'h4):(1'h1)] ?
          $unsigned((+(7'h40))) : (^wire179))));
    end
  assign wire189 = wire183[(3'h6):(2'h3)];
  assign wire190 = $signed(wire180[(4'h9):(1'h1)]);
  assign wire191 = ($unsigned($signed($signed($unsigned(wire180)))) ?
                       wire190 : ((!$unsigned($signed(wire180))) ?
                           $signed(wire189) : (((&reg188) <<< (8'ha8)) ?
                               $signed((wire181 * (8'h9c))) : $unsigned((reg185 ?
                                   wire190 : wire190)))));
  assign wire192 = $signed(wire189[(4'ha):(1'h0)]);
  assign wire193 = $signed($unsigned($signed(((wire190 >= wire179) ?
                       (~^wire183) : (wire179 | wire191)))));
  always
    @(posedge clk) begin
      reg194 <= $unsigned($signed(wire189));
    end
  assign wire195 = (((8'ha6) ?
                       (wire190 ?
                           reg184 : (~(reg185 < wire178))) : ($signed((-reg186)) < wire177[(3'h5):(2'h2)])) * wire191);
  assign wire196 = $signed(reg194[(1'h1):(1'h0)]);
  assign wire197 = (-$unsigned(reg188[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      reg198 <= $signed(wire191);
      reg199 <= ($signed(wire196[(3'h6):(1'h0)]) ?
          $unsigned(wire196[(3'h6):(3'h5)]) : {wire176[(1'h1):(1'h0)],
              (^~$unsigned($unsigned((8'hb3))))});
      reg200 <= wire182;
    end
endmodule

module module159  (y, clk, wire163, wire162, wire161, wire160);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire163;
  input wire signed [(4'hd):(1'h0)] wire162;
  input wire [(3'h6):(1'h0)] wire161;
  input wire [(4'hb):(1'h0)] wire160;
  wire [(3'h6):(1'h0)] wire171;
  wire [(2'h2):(1'h0)] wire170;
  wire [(5'h12):(1'h0)] wire169;
  wire signed [(4'ha):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire167;
  wire signed [(3'h5):(1'h0)] wire164;
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire164,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire164 = ({(&$signed($unsigned(wire161)))} ?
                       wire163[(2'h3):(2'h3)] : (wire162[(4'ha):(3'h5)] ?
                           $unsigned({(8'hb3)}) : {$unsigned((!wire163))}));
  always
    @(posedge clk) begin
      reg165 <= (($signed(wire161) ?
              (wire162 > {$unsigned(wire163),
                  (~|wire161)}) : {($unsigned(wire163) ?
                      ((8'hb1) - wire162) : (-wire164))}) ?
          ((~((8'hb0) >>> $signed(wire161))) ?
              wire163 : $signed((wire164[(1'h1):(1'h0)] ?
                  wire162 : wire162[(2'h2):(1'h1)]))) : {(-$signed($unsigned(wire164))),
              ((wire163 == (wire163 != wire164)) << $signed($unsigned(wire163)))});
      reg166 <= $unsigned(reg165[(4'ha):(4'ha)]);
    end
  assign wire167 = $signed($signed((($unsigned(wire162) ?
                           ((7'h41) ^~ reg165) : wire161[(3'h5):(3'h5)]) ?
                       (wire160 ?
                           {(8'hb9),
                               (8'hb4)} : $signed(wire163)) : ($unsigned(wire163) ?
                           $signed(wire162) : $signed(reg165)))));
  assign wire168 = {(-(($unsigned(reg166) >= (wire161 ?
                           wire161 : wire162)) == (~|{wire162, wire161}))),
                       (((&(8'hb8)) >>> $signed(((8'ha6) ? wire164 : reg165))) ?
                           wire163[(3'h5):(2'h3)] : (wire162[(2'h2):(1'h0)] ?
                               (8'hb7) : $unsigned({wire167})))};
  assign wire169 = $signed((($signed((wire161 >>> (8'hb7))) == reg166[(2'h2):(1'h1)]) ?
                       $signed(reg166[(3'h4):(1'h0)]) : ((wire167 ?
                           wire161[(3'h5):(2'h2)] : $signed(wire168)) | $signed((reg165 ?
                           wire164 : wire168)))));
  assign wire170 = wire167;
  assign wire171 = (wire162[(4'h8):(3'h6)] + $signed({({wire168} || wire168[(1'h0):(1'h0)]),
                       $signed((~^reg166))}));
endmodule
