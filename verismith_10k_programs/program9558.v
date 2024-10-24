module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire160;
  wire signed [(5'h11):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire157;
  wire signed [(4'he):(1'h0)] wire5;
  assign y = {wire161, wire160, wire159, wire157, wire5, (1'h0)};
  assign wire5 = wire4[(1'h0):(1'h0)];
  module6 #() modinst158 (.clk(clk), .y(wire157), .wire10(wire4), .wire8(wire0), .wire7(wire3), .wire9(wire1));
  assign wire159 = $signed(((!wire0[(5'h11):(2'h3)]) ^ ($signed((wire5 & (8'h9e))) > $unsigned((|wire4)))));
  assign wire160 = wire1[(4'hc):(3'h7)];
  assign wire161 = {($signed(($signed(wire0) == wire2)) ?
                           wire160 : $signed((!$signed(wire5)))),
                       {(wire159 ?
                               ((wire160 ? wire4 : wire1) ?
                                   wire3[(3'h4):(3'h4)] : wire5[(1'h0):(1'h0)]) : wire0[(5'h12):(3'h6)])}};
endmodule

module module6
#(parameter param156 = {(((((8'h9e) ? (8'hb1) : (8'hac)) >= ((7'h42) ? (8'ha4) : (8'h9c))) ? (((7'h42) <= (8'ha3)) | ((7'h40) ? (8'ha7) : (8'ha7))) : {((8'ha2) <= (8'had))}) ? ((8'hb4) ? (~(8'hb7)) : (8'hb3)) : (~^(^~{(8'hbe), (7'h41)})))})
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h2dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire152;
  wire [(5'h13):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire137;
  wire signed [(4'ha):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire103;
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  assign y = {wire155,
                 wire152,
                 wire150,
                 wire137,
                 wire136,
                 wire105,
                 wire11,
                 wire12,
                 wire26,
                 wire27,
                 wire64,
                 wire66,
                 wire67,
                 wire103,
                 reg154,
                 reg153,
                 reg25,
                 reg24,
                 reg23,
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
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 (1'h0)};
  assign wire11 = $unsigned((($unsigned($signed((7'h43))) ?
                      $unsigned({wire7, wire7}) : ((&wire8) ?
                          wire9 : (!wire8))) ~^ (wire10 ?
                      wire8[(2'h3):(2'h3)] : $signed((wire8 ?
                          wire10 : wire9)))));
  assign wire12 = $signed(wire11[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg13 <= $signed(({wire12} ? {(~{wire8})} : $signed($unsigned({wire7}))));
      reg14 <= (^~(reg13[(3'h7):(3'h7)] ?
          (!$unsigned($signed(reg13))) : (wire9[(2'h2):(2'h2)] >>> ($signed(wire8) ?
              wire8[(3'h7):(1'h0)] : (wire11 ? wire11 : (8'hb5))))));
      if (wire9[(1'h0):(1'h0)])
        begin
          reg15 <= reg14[(5'h10):(5'h10)];
          reg16 <= $unsigned(wire7[(3'h5):(3'h4)]);
          reg17 <= $unsigned(reg13[(1'h0):(1'h0)]);
          reg18 <= $unsigned({wire12[(3'h7):(2'h2)],
              $unsigned($unsigned(reg17))});
        end
      else
        begin
          reg15 <= $signed($signed(($unsigned((~(8'hb3))) ?
              $signed((reg18 ? (8'hb7) : reg18)) : $signed((wire9 < wire10)))));
          reg16 <= $signed((reg18[(3'h5):(2'h2)] ?
              wire12 : $unsigned({(~^reg17)})));
          if ((^$unsigned($unsigned($unsigned({(8'haa)})))))
            begin
              reg17 <= reg18[(1'h0):(1'h0)];
              reg18 <= wire12;
              reg19 <= (reg16 != $unsigned(((^~(reg16 == reg17)) + reg18)));
            end
          else
            begin
              reg17 <= (+$unsigned(wire7));
              reg18 <= reg15;
              reg19 <= ($unsigned((reg17[(1'h1):(1'h0)] ?
                      $unsigned(((8'ha1) ?
                          wire10 : wire12)) : (-$signed(wire9)))) ?
                  ($signed({(wire12 ? wire8 : (8'ha1)), (~reg17)}) ?
                      (|((reg13 >= wire8) ?
                          (wire11 ~^ (7'h40)) : wire9)) : ($signed((reg15 ~^ wire9)) ?
                          (|reg17[(1'h0):(1'h0)]) : reg19[(3'h5):(2'h2)])) : {reg14});
              reg20 <= (((|(&reg13[(3'h5):(3'h5)])) ?
                  $signed(wire11[(1'h0):(1'h0)]) : reg16[(3'h5):(3'h4)]) + wire7);
              reg21 <= wire9;
            end
          if (reg16)
            begin
              reg22 <= $signed(wire11[(2'h2):(1'h1)]);
              reg23 <= $unsigned((($unsigned((8'ha0)) ?
                      $signed((reg15 == wire7)) : ({reg15, (8'hb8)} ?
                          wire9 : reg22)) ?
                  (!reg18[(4'hf):(1'h0)]) : $signed(wire7)));
            end
          else
            begin
              reg22 <= ($signed($signed($signed((8'hb9)))) ?
                  wire9[(2'h2):(2'h2)] : $unsigned($unsigned($unsigned(reg15))));
              reg23 <= (^~($unsigned((((8'ha1) ? reg18 : (8'ha8)) ?
                      (~&(8'hb3)) : (reg14 > reg20))) ?
                  wire10 : $unsigned(reg13[(2'h3):(2'h3)])));
              reg24 <= wire11[(1'h1):(1'h0)];
              reg25 <= wire8;
            end
        end
    end
  assign wire26 = reg17[(4'h8):(2'h2)];
  assign wire27 = ((reg18 ?
                      reg21 : (reg15 ?
                          {$signed(reg21),
                              wire26[(1'h1):(1'h1)]} : (wire7[(4'hd):(4'h9)] >= wire7[(4'ha):(3'h6)]))) <<< (&$signed($signed($unsigned(reg13)))));
  module28 #() modinst65 (.wire29(wire7), .wire30(reg22), .wire31(reg14), .wire32(wire11), .clk(clk), .y(wire64));
  assign wire66 = reg20[(4'he):(4'ha)];
  assign wire67 = reg19[(4'ha):(3'h5)];
  module68 #() modinst104 (.clk(clk), .y(wire103), .wire69(wire67), .wire70(wire10), .wire71(wire64), .wire72(reg24));
  assign wire105 = (~^reg15[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      reg106 <= wire10;
      reg107 <= (wire67 ?
          (reg22[(5'h10):(1'h1)] ?
              $unsigned($unsigned((wire27 << reg18))) : (^~reg17)) : (~^(!($unsigned((8'hb3)) ?
              (!reg106) : $signed(reg15)))));
      reg108 <= $unsigned((wire67[(4'ha):(3'h6)] ^~ $signed(((!(8'hac)) ?
          ((8'ha9) <<< (8'ha4)) : $unsigned(reg14)))));
      if ((^reg13[(3'h6):(1'h1)]))
        begin
          reg109 <= $unsigned(($unsigned(reg15[(1'h1):(1'h1)]) ~^ wire27));
          reg110 <= $unsigned(((((wire8 >> wire105) ?
                  (-wire64) : wire8) ^~ (^(reg18 & (8'haf)))) ?
              $signed(reg20) : {$unsigned((reg106 * reg14)),
                  wire9[(1'h0):(1'h0)]}));
          if (wire66)
            begin
              reg111 <= reg107;
              reg112 <= $signed(wire64[(5'h12):(1'h0)]);
            end
          else
            begin
              reg111 <= ($unsigned($unsigned($unsigned((reg106 <= reg18)))) != reg109);
              reg112 <= reg15[(3'h5):(2'h2)];
            end
          reg113 <= wire26;
          reg114 <= $signed(reg19[(3'h6):(1'h1)]);
        end
      else
        begin
          reg109 <= $unsigned((!wire67));
          if (reg21[(1'h0):(1'h0)])
            begin
              reg110 <= wire64[(2'h3):(2'h2)];
            end
          else
            begin
              reg110 <= $unsigned(reg21);
              reg111 <= {wire67, $unsigned(reg19)};
              reg112 <= $unsigned(((reg111 ^~ (wire12[(3'h4):(3'h4)] ?
                      {wire7} : (!(7'h40)))) ?
                  ($signed($unsigned(reg19)) >> ($unsigned(reg108) && (8'hb7))) : $unsigned(((reg106 ?
                          reg15 : reg111) ?
                      (wire10 << wire12) : {wire105, wire66}))));
              reg113 <= {(^wire64),
                  $signed((!{(reg15 ? wire27 : reg15), {reg109}}))};
            end
          if ((($unsigned($signed($unsigned(wire8))) ^ reg110) ?
              (|(^((|(7'h41)) != (wire103 ? reg14 : reg15)))) : reg108))
            begin
              reg114 <= (^~{($unsigned(reg20[(4'h9):(1'h0)]) ?
                      $signed((reg18 >= wire10)) : (^~$unsigned((8'had)))),
                  (reg24[(3'h7):(1'h0)] ^ $signed({reg21, reg22}))});
              reg115 <= wire10;
            end
          else
            begin
              reg114 <= reg13;
              reg115 <= ((~{{((7'h43) ? reg106 : wire12)},
                      (reg16[(4'h8):(3'h7)] + (wire26 ? wire26 : reg21))}) ?
                  $signed($signed($unsigned({reg112,
                      reg18}))) : reg114[(3'h6):(3'h6)]);
            end
        end
      if (($signed($signed((^~reg20[(4'he):(3'h5)]))) ?
          wire11[(2'h2):(1'h0)] : (8'hb3)))
        begin
          reg116 <= ({(8'hb6), $unsigned(($signed(wire26) || (|(8'hb6))))} ?
              (($signed({reg20}) >= (wire10 ~^ (reg15 <<< reg20))) ?
                  wire64 : (wire11[(2'h3):(1'h1)] >= (-{reg112,
                      reg18}))) : $signed($unsigned({$unsigned(reg106),
                  (~^reg108)})));
          if ($unsigned({reg106[(3'h5):(2'h3)], {reg108[(3'h4):(2'h2)]}}))
            begin
              reg117 <= reg14;
              reg118 <= (+$unsigned((+(~|{reg117, wire7}))));
              reg119 <= (-reg108);
              reg120 <= {$unsigned({($unsigned(reg110) ?
                          $unsigned(wire64) : reg106)}),
                  wire64[(4'hd):(4'hb)]};
            end
          else
            begin
              reg117 <= {(+$signed($signed((wire11 ~^ wire26)))),
                  $signed($signed($signed((reg118 ? reg25 : reg16))))};
              reg118 <= $signed(wire67);
              reg119 <= ((^(wire103 ?
                      ({wire26} != ((7'h41) > (8'ha9))) : $signed((reg15 <= reg110)))) ?
                  (((~^reg108) > $signed((!reg15))) ?
                      $signed(reg118) : (^((reg106 | reg117) ?
                          (~|wire8) : wire105[(4'hc):(3'h6)]))) : (-wire9));
              reg120 <= $signed($unsigned((+(wire67[(1'h1):(1'h0)] ?
                  reg115[(2'h2):(2'h2)] : wire26[(3'h4):(3'h4)]))));
              reg121 <= $unsigned($signed($unsigned((&$unsigned((8'h9f))))));
            end
          reg122 <= reg111;
          if (reg108)
            begin
              reg123 <= reg25;
              reg124 <= ($signed((wire12[(4'he):(2'h2)] * ({(8'haa), (8'hb0)} ?
                  wire26 : $signed(wire11)))) <<< reg24);
              reg125 <= $signed(reg119);
              reg126 <= $signed(reg122[(1'h1):(1'h1)]);
              reg127 <= reg111[(4'hb):(3'h6)];
            end
          else
            begin
              reg123 <= (reg110[(1'h1):(1'h0)] < reg21[(4'h8):(2'h2)]);
              reg124 <= $signed((reg126[(5'h13):(5'h11)] ?
                  wire103[(3'h7):(3'h5)] : ($signed($unsigned((8'hb7))) ^ reg109[(3'h5):(2'h3)])));
              reg125 <= $unsigned(wire105);
              reg126 <= ($unsigned((reg23[(1'h0):(1'h0)] ?
                  ({reg21} * {(8'hbb)}) : {((8'ha5) ? reg119 : (8'ha0)),
                      (|reg13)})) > reg109);
            end
          reg128 <= (($signed($signed((~|(8'hba)))) ?
              $unsigned($signed(wire9)) : ($signed((~wire64)) + (~(reg122 ?
                  (8'haf) : wire67)))) & $unsigned(wire8));
        end
      else
        begin
          reg116 <= $unsigned($signed($signed(((+(8'hbe)) ?
              (wire8 || reg106) : $signed((8'h9e))))));
          reg117 <= ((wire9[(2'h2):(2'h2)] + (8'hab)) | (~^$signed((((8'ha5) ^ reg23) - (reg125 ?
              wire103 : reg106)))));
        end
    end
  always
    @(posedge clk) begin
      reg129 <= $signed(wire10);
      reg130 <= (!reg122[(1'h0):(1'h0)]);
      reg131 <= ($unsigned((($signed(reg127) ?
              (reg129 ? wire27 : reg119) : $unsigned(reg119)) ^ {wire26})) ?
          (8'hbb) : (~|reg18[(4'ha):(4'ha)]));
      if ((^$unsigned($unsigned({(wire12 <<< reg120)}))))
        begin
          reg132 <= {reg121[(4'h9):(2'h3)]};
          reg133 <= ((reg129[(2'h2):(1'h1)] ?
              (((reg129 ? reg121 : reg132) != (reg21 ? wire11 : wire105)) ?
                  reg18[(3'h5):(3'h4)] : reg17[(2'h3):(2'h3)]) : reg17[(1'h0):(1'h0)]) <= $unsigned($unsigned((~&(!wire66)))));
          reg134 <= (|reg25[(1'h1):(1'h0)]);
          reg135 <= reg108[(3'h4):(1'h1)];
        end
      else
        begin
          reg132 <= (8'ha9);
          reg133 <= $unsigned($signed((~&wire12)));
          reg134 <= $unsigned(reg13[(3'h5):(2'h2)]);
        end
    end
  assign wire136 = $signed(((+reg131[(2'h2):(2'h2)]) ^ $unsigned($signed(reg22[(4'hb):(4'ha)]))));
  assign wire137 = $unsigned($unsigned($unsigned(((reg108 ? (8'h9e) : reg107) ?
                       $unsigned(reg110) : (reg19 ? reg115 : reg131)))));
  module138 #() modinst151 (.y(wire150), .wire142(reg118), .clk(clk), .wire140(reg107), .wire139(wire10), .wire141(wire9), .wire143(reg18));
  assign wire152 = (~|(!$signed(($signed(reg131) ? reg13 : {reg127}))));
  always
    @(posedge clk) begin
      reg153 <= ({$signed((8'hb1)),
          ($signed((reg22 <<< (8'haf))) <<< ((wire105 ? reg118 : wire67) ?
              wire152 : {reg15, wire7}))} >= ($signed({(reg134 ?
                  wire137 : reg133)}) ?
          ($signed((8'hbe)) <= ((reg108 ? (8'ha4) : reg116) ?
              $unsigned((8'had)) : {reg13,
                  reg127})) : (~^reg15[(1'h1):(1'h1)])));
      reg154 <= $signed((($signed(reg114[(3'h7):(3'h4)]) & {(reg129 ?
                  reg108 : reg107),
              (reg133 ? wire137 : reg106)}) ?
          ($signed((reg115 ? wire10 : reg128)) ?
              (^~(reg128 >>> wire10)) : (8'ha7)) : ($unsigned({wire11}) ?
              reg118[(4'hb):(2'h3)] : reg133)));
    end
  assign wire155 = (8'ha7);
endmodule

module module138
#(parameter param148 = ({(({(8'h9c), (8'hbc)} ~^ ((8'hbd) ? (7'h42) : (8'h9e))) ? {((8'h9e) ? (8'hb4) : (8'hb7))} : (8'hba)), ((8'hb9) ? (~(8'ha9)) : (&{(8'ha9), (8'hba)}))} ? ((!(~^(!(8'hbe)))) ? (&{((8'ha7) <= (8'hb7)), ((8'hb7) - (8'hb6))}) : (((^(8'h9e)) != (~&(8'hac))) >= (^~((8'ha4) ? (8'hba) : (8'h9e))))) : {(|{((8'hac) ^~ (8'hb4))})}), 
parameter param149 = (((!({param148, param148} ? param148 : (param148 ~^ param148))) || (^(param148 ? (param148 < param148) : ((8'hba) * param148)))) ? (param148 ? (param148 == param148) : param148) : ({((param148 ? param148 : param148) - ((8'had) == param148))} <<< (((param148 ^~ param148) ? param148 : (param148 != param148)) ? {(param148 > param148), {param148, param148}} : ((param148 ? param148 : param148) ? (&param148) : (&param148))))))
(y, clk, wire143, wire142, wire141, wire140, wire139);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire143;
  input wire signed [(4'he):(1'h0)] wire142;
  input wire [(4'ha):(1'h0)] wire141;
  input wire signed [(3'h6):(1'h0)] wire140;
  input wire signed [(5'h14):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire147;
  wire signed [(5'h14):(1'h0)] wire146;
  wire [(4'ha):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire144;
  assign y = {wire147, wire146, wire145, wire144, (1'h0)};
  assign wire144 = (|wire142);
  assign wire145 = ((!(wire144[(1'h1):(1'h0)] ?
                       $unsigned({wire141}) : (-{wire139}))) > {$signed($signed({wire142}))});
  assign wire146 = {wire142, wire139[(2'h3):(2'h2)]};
  assign wire147 = (((({(8'hb7), wire141} ?
                                   wire146[(1'h1):(1'h1)] : $signed(wire140)) ?
                               {(wire141 | (8'hae)),
                                   wire141[(3'h4):(2'h2)]} : wire144[(3'h5):(2'h2)]) ?
                           wire144[(1'h1):(1'h0)] : (~^(^~wire140))) ?
                       (~wire141[(3'h7):(2'h2)]) : (($signed((wire139 ?
                               wire144 : wire145)) ?
                           $unsigned(wire143) : wire142[(3'h7):(2'h3)]) <= ({(~&(8'ha9))} ^ ($unsigned((8'ha2)) ?
                           wire140[(1'h0):(1'h0)] : {wire146, wire141}))));
endmodule

module module68
#(parameter param101 = ((~&(-((&(8'hba)) <= ((8'h9c) * (8'haf))))) ? {(&(&{(8'ha0), (8'ha8)}))} : (!((^~(8'hb1)) != (((8'hb0) ? (8'ha8) : (8'hbe)) < {(8'hba), (8'hb9)})))), 
parameter param102 = (~&(8'hb5)))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire72;
  input wire signed [(5'h14):(1'h0)] wire71;
  input wire [(5'h15):(1'h0)] wire70;
  input wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire74,
                 wire73,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire73 = $unsigned(wire71[(2'h3):(2'h3)]);
  assign wire74 = wire72;
  always
    @(posedge clk) begin
      reg75 <= (^~$signed((8'hbc)));
      reg76 <= wire71;
    end
  assign wire77 = (((~wire73[(1'h0):(1'h0)]) ?
                      wire74[(4'h9):(1'h0)] : (~(-$unsigned(wire74)))) >> (({wire71,
                      wire73[(1'h1):(1'h1)]} <<< $signed({reg76})) | ($signed((wire69 >>> reg76)) | ($signed(wire71) - (^~wire73)))));
  assign wire78 = $unsigned((((~&reg75[(1'h0):(1'h0)]) ?
                      (wire71 ?
                          $unsigned(wire74) : reg76[(4'ha):(1'h0)]) : wire74[(4'hb):(1'h1)]) - reg75[(2'h2):(1'h0)]));
  assign wire79 = $unsigned((~wire69));
  assign wire80 = (reg76 ?
                      ($unsigned(((wire79 | wire73) >= $signed(wire70))) ?
                          $unsigned(($signed(reg76) ?
                              (8'ha1) : (wire74 <= wire72))) : ($unsigned((~|reg75)) ?
                              reg76 : ($unsigned(wire78) ?
                                  wire78 : (~wire73)))) : wire73[(1'h0):(1'h0)]);
  assign wire81 = wire79[(5'h13):(3'h7)];
  assign wire82 = (wire81 ?
                      $unsigned($unsigned((wire69[(4'hb):(3'h4)] ^ wire70))) : $unsigned($signed(($unsigned(wire74) <<< ((7'h43) ?
                          wire72 : (8'hbd))))));
  assign wire83 = reg76;
  always
    @(posedge clk) begin
      reg84 <= wire81[(2'h3):(1'h0)];
      if (reg75)
        begin
          if ({$unsigned((wire69 >>> ($signed(wire70) ?
                  reg76[(2'h3):(1'h1)] : {reg75, wire71})))})
            begin
              reg85 <= wire69[(4'h9):(2'h3)];
              reg86 <= (wire81 | reg76[(4'hf):(4'ha)]);
            end
          else
            begin
              reg85 <= ($signed(({wire81} ?
                      ((wire82 ? wire73 : reg86) ?
                          (wire80 || wire81) : $signed(wire74)) : (-{wire71,
                          reg85}))) ?
                  ({$unsigned(wire79),
                      ({reg86, wire78} ?
                          reg84[(1'h1):(1'h1)] : (|wire83))} ~^ reg75) : $signed($signed((~|(reg75 & reg76)))));
              reg86 <= $unsigned((|(wire78[(2'h2):(1'h0)] ?
                  wire71[(1'h0):(1'h0)] : reg76)));
              reg87 <= $unsigned(reg86[(4'hf):(3'h4)]);
            end
        end
      else
        begin
          reg85 <= ($signed((((7'h44) ~^ (wire70 > wire73)) ?
                  ($unsigned(wire72) ~^ (~wire82)) : (-wire70))) ?
              {{wire79[(4'h8):(3'h4)]}} : (^~reg76));
        end
      reg88 <= (((((&wire79) ?
              reg84 : (wire78 * wire83)) == (reg86 ~^ (wire80 ^~ (8'hb1)))) + $signed($unsigned($signed(wire72)))) ?
          reg87 : ($signed($unsigned(reg75)) ?
              ({$unsigned(wire72),
                  $signed(wire72)} - $unsigned($unsigned(wire69))) : wire81));
      if ($signed((wire72 ?
          ({(+wire77)} ?
              (wire77[(4'h8):(3'h4)] ?
                  $unsigned(wire73) : {wire83,
                      (8'had)}) : ((wire74 <<< wire73) & (8'hbd))) : (+$signed(wire71)))))
        begin
          reg89 <= (|(~(wire80 ~^ {{wire74}})));
          reg90 <= $signed($unsigned(wire72));
          reg91 <= $signed(($unsigned($signed(wire72[(1'h0):(1'h0)])) ?
              ({(^~reg76)} & wire82) : $unsigned(((reg75 + wire72) | $signed(reg90)))));
        end
      else
        begin
          reg89 <= $unsigned($signed($signed($unsigned($signed(reg90)))));
          reg90 <= wire73;
          reg91 <= (~^$unsigned((reg85[(3'h4):(2'h3)] | ($unsigned((8'ha5)) != reg89))));
        end
    end
  assign wire92 = $unsigned((wire79 << (^~(~|wire80[(2'h2):(1'h1)]))));
  assign wire93 = (!wire92[(4'hf):(4'hd)]);
  assign wire94 = (^((wire80 ?
                      wire83[(1'h0):(1'h0)] : (wire79[(5'h11):(4'hc)] == $signed(wire77))) ^~ wire80[(2'h2):(1'h0)]));
  assign wire95 = $unsigned($unsigned((~|reg91)));
  always
    @(posedge clk) begin
      reg96 <= reg76[(1'h0):(1'h0)];
      reg97 <= (^~((|($unsigned(wire79) + wire93)) ?
          (~^wire70[(5'h12):(4'h9)]) : wire79[(5'h10):(5'h10)]));
      reg98 <= reg84;
      reg99 <= {(!reg75[(2'h3):(1'h1)]),
          (((wire78 ? $signed(wire81) : (|wire93)) ?
                  {wire70} : wire69[(1'h1):(1'h1)]) ?
              wire92[(5'h14):(5'h14)] : wire80[(2'h3):(1'h1)])};
      reg100 <= (8'hbd);
    end
endmodule

module module28
#(parameter param62 = {{(^~({(8'ha0), (7'h40)} << ((8'haa) | (8'hba)))), ((((8'hb3) >= (8'ha6)) ? (^(7'h43)) : ((8'hbd) ^ (8'hb7))) ^ (!((7'h40) ? (8'had) : (8'haf))))}, (((^((7'h44) ? (8'hb6) : (8'hb3))) == (|(^(8'hb5)))) ? ((~((7'h41) * (8'ha0))) >>> (((8'hb3) ? (8'had) : (8'ha5)) && ((8'had) - (8'ha9)))) : ((((8'ha7) << (8'hab)) * ((8'had) ? (8'hb6) : (7'h44))) ? {((8'ha4) && (8'h9d))} : (~^((8'hb5) ? (8'ha4) : (7'h40)))))}, 
parameter param63 = ((param62 ? param62 : param62) ~^ ((~({param62, param62} ? param62 : param62)) ? (8'hb9) : {((~^param62) | param62), {(8'hbb)}})))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire32;
  input wire [(3'h5):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire34,
                 wire33,
                 reg56,
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
                 (1'h0)};
  assign wire33 = wire32;
  assign wire34 = $unsigned($unsigned(($signed($signed(wire33)) >= (8'ha1))));
  always
    @(posedge clk) begin
      reg35 <= (^($signed(wire30) ? (~wire33) : (~&wire31)));
      reg36 <= $signed(((+(8'ha6)) >> (^wire30)));
      if (reg36)
        begin
          reg37 <= reg35;
          if ((reg36[(3'h6):(3'h6)] ?
              reg36 : ((|wire29[(4'ha):(4'h9)]) < ((&wire30) ?
                  $unsigned($signed(wire34)) : $signed((~^wire29))))))
            begin
              reg38 <= (~^$unsigned(wire34[(4'h9):(3'h5)]));
              reg39 <= $unsigned($unsigned($signed((reg37 ?
                  ((8'h9e) ? wire29 : reg36) : (wire31 * reg35)))));
              reg40 <= wire29;
              reg41 <= $signed($unsigned($unsigned(($unsigned(reg38) == $unsigned(reg38)))));
              reg42 <= $unsigned((reg38[(1'h1):(1'h1)] + (-wire32[(3'h6):(2'h3)])));
            end
          else
            begin
              reg38 <= wire32[(4'h9):(2'h2)];
            end
        end
      else
        begin
          reg37 <= reg41[(5'h11):(4'ha)];
          if ((($signed((!((7'h40) >>> reg37))) ?
              $unsigned($signed($signed(wire32))) : (($signed(wire32) <= reg42[(2'h3):(1'h0)]) ?
                  ((~|reg36) ?
                      (reg41 ?
                          reg39 : reg40) : reg40) : $unsigned($signed(reg36)))) < reg35))
            begin
              reg38 <= reg37;
              reg39 <= reg41;
              reg40 <= (wire32[(4'ha):(2'h3)] == $unsigned($unsigned($signed($signed(wire29)))));
            end
          else
            begin
              reg38 <= $unsigned(reg40);
              reg39 <= (^~$signed($unsigned((reg41 ?
                  (wire32 ? reg40 : (8'hb2)) : $signed(reg36)))));
              reg40 <= ({({reg39[(4'hc):(4'h9)]} ?
                          (~(reg38 ?
                              wire33 : reg40)) : ($signed((8'hac)) < (+reg38))),
                      (reg36 ?
                          ({wire30} ?
                              $unsigned(wire31) : $unsigned(reg37)) : $signed((reg36 <<< reg39)))} ?
                  $signed(reg42) : $signed(reg37));
              reg41 <= (wire29[(4'hc):(1'h1)] ^ $unsigned(reg40[(1'h0):(1'h0)]));
            end
          if ((^$signed(($unsigned((!wire32)) ?
              {(wire30 + reg35), reg35[(2'h2):(2'h2)]} : $unsigned({reg36,
                  wire33})))))
            begin
              reg42 <= (&($unsigned((7'h43)) ?
                  (reg38[(2'h3):(2'h3)] ?
                      ((reg35 ? wire34 : wire29) ?
                          {reg38} : $unsigned(wire31)) : ($signed(reg37) && $signed(reg35))) : $signed($unsigned(reg35[(3'h5):(3'h5)]))));
              reg43 <= (!reg42[(4'h8):(1'h0)]);
              reg44 <= $signed(reg43);
              reg45 <= (!((~{(reg39 ? reg43 : reg37)}) + $unsigned(wire31)));
            end
          else
            begin
              reg42 <= $unsigned($unsigned((8'h9d)));
              reg43 <= ($signed((&(+$signed(wire32)))) << wire32[(3'h4):(3'h4)]);
            end
          reg46 <= ({(reg43 ?
                      (!((7'h40) ^ (8'h9c))) : {reg40, $unsigned(reg37)}),
                  ($unsigned((~reg41)) ? {reg43} : reg41[(1'h0):(1'h0)])} ?
              (!$unsigned((8'hb5))) : reg35[(2'h2):(2'h2)]);
          reg47 <= reg37;
        end
      reg48 <= (&(+reg42));
      reg49 <= $unsigned((~reg35[(2'h2):(2'h2)]));
    end
  assign wire50 = reg39;
  assign wire51 = reg36;
  assign wire52 = (8'hb5);
  assign wire53 = $signed(((8'haf) ?
                      (^$signed($unsigned(reg46))) : $signed($signed((reg41 ?
                          reg37 : wire31)))));
  assign wire54 = (($signed($unsigned((&reg48))) != $signed({{wire50}})) ^ ($signed($signed(reg48[(3'h6):(3'h4)])) ?
                      reg45[(3'h4):(2'h3)] : $unsigned((8'h9c))));
  assign wire55 = (&(8'hb0));
  always
    @(posedge clk) begin
      reg56 <= (!(+((|wire32) ?
          $unsigned($unsigned(wire53)) : {(reg39 + wire50)})));
    end
  assign wire57 = (&$signed($signed(($unsigned(wire31) ? reg35 : wire31))));
  assign wire58 = (wire55[(4'hc):(3'h6)] ^ ({$signed((reg39 ? reg40 : wire29)),
                      reg45} >>> (~$signed(wire32[(4'h9):(3'h5)]))));
  assign wire59 = $unsigned((&(reg48 ?
                      ($signed(wire58) ?
                          (reg49 * reg42) : wire30[(3'h7):(2'h3)]) : ($unsigned(reg38) ?
                          (-reg40) : (wire33 ? reg49 : wire57)))));
  assign wire60 = ((~^$unsigned(((reg42 ? wire58 : (8'ha3)) ?
                      reg37[(1'h1):(1'h1)] : $signed(wire32)))) ^~ wire29[(4'hb):(4'h8)]);
  assign wire61 = reg39;
endmodule
