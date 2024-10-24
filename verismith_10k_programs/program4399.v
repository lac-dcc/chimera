module top
#(parameter param347 = ((~&{({(8'ha2), (8'hb3)} && (8'h9d))}) ? (~|(^(+((8'hac) > (8'h9d))))) : (8'ha0)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire346;
  wire [(3'h7):(1'h0)] wire345;
  wire signed [(4'hc):(1'h0)] wire344;
  wire [(3'h6):(1'h0)] wire343;
  wire signed [(5'h12):(1'h0)] wire342;
  wire [(5'h11):(1'h0)] wire340;
  wire signed [(4'hb):(1'h0)] wire339;
  wire signed [(3'h6):(1'h0)] wire338;
  wire [(4'hc):(1'h0)] wire337;
  wire [(2'h2):(1'h0)] wire336;
  wire signed [(5'h14):(1'h0)] wire325;
  wire [(5'h10):(1'h0)] wire324;
  wire signed [(4'hd):(1'h0)] wire323;
  wire [(5'h11):(1'h0)] wire321;
  wire [(5'h14):(1'h0)] wire320;
  wire signed [(4'hf):(1'h0)] wire316;
  wire [(5'h11):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire318;
  reg signed [(5'h13):(1'h0)] reg335 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg334 = (1'h0);
  reg [(4'hf):(1'h0)] reg333 = (1'h0);
  reg [(4'hb):(1'h0)] reg332 = (1'h0);
  reg [(4'hf):(1'h0)] reg331 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg330 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg329 = (1'h0);
  reg [(4'hb):(1'h0)] reg328 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg327 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg326 = (1'h0);
  assign y = {wire346,
                 wire345,
                 wire344,
                 wire343,
                 wire342,
                 wire340,
                 wire339,
                 wire338,
                 wire337,
                 wire336,
                 wire325,
                 wire324,
                 wire323,
                 wire321,
                 wire320,
                 wire316,
                 wire59,
                 wire318,
                 reg335,
                 reg334,
                 reg333,
                 reg332,
                 reg331,
                 reg330,
                 reg329,
                 reg328,
                 reg327,
                 reg326,
                 (1'h0)};
  module4 #() modinst60 (.clk(clk), .wire5((8'ha4)), .wire8(wire0), .wire6(wire3), .y(wire59), .wire7(wire1), .wire9(wire2));
  module61 #() modinst317 (wire316, clk, wire3, wire59, wire1, wire0, wire2);
  module4 #() modinst319 (wire318, clk, wire1, wire316, wire3, wire59, wire2);
  assign wire320 = wire0[(3'h4):(2'h2)];
  module243 #() modinst322 (.wire245(wire316), .wire244(wire0), .clk(clk), .wire246(wire318), .wire247(wire59), .y(wire321));
  assign wire323 = (((~($unsigned(wire1) ?
                           wire59[(3'h4):(1'h0)] : (wire0 ?
                               wire318 : wire2))) ~^ ((+$unsigned(wire2)) >> (^~$signed(wire1)))) ?
                       wire3 : (^($signed($unsigned((8'hb3))) > wire316[(4'hc):(3'h5)])));
  assign wire324 = wire320[(2'h3):(1'h0)];
  assign wire325 = ((~^((!(^~wire0)) ?
                       ((wire324 ? wire320 : wire59) || wire318) : (~&(wire323 ?
                           wire3 : wire0)))) && wire323[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      if ((wire324 - $signed(wire3[(3'h7):(2'h3)])))
        begin
          reg326 <= {wire0[(3'h7):(1'h1)],
              $unsigned(({wire321} - ((wire2 < wire321) | (&wire323))))};
          if (({wire59, wire316[(1'h1):(1'h0)]} ?
              ((~&(|(wire321 ? wire323 : wire324))) ?
                  wire0 : (!$unsigned($unsigned(wire323)))) : wire320))
            begin
              reg327 <= wire0[(3'h4):(2'h2)];
              reg328 <= (wire59 ?
                  {{$signed((8'ha8)), wire1},
                      {(|reg327)}} : $unsigned($unsigned(($signed(wire2) && $signed(reg326)))));
            end
          else
            begin
              reg327 <= {reg328[(4'h9):(4'h9)]};
              reg328 <= (8'ha3);
            end
          reg329 <= {(~&wire2[(4'hb):(4'hb)]),
              (((8'ha5) ? wire323 : wire0) ? wire3 : (8'hbd))};
          reg330 <= ((reg327[(4'ha):(2'h2)] ?
              wire316 : wire325) ~^ (|$unsigned((reg328[(3'h4):(2'h2)] ?
              (8'ha7) : (wire2 <<< (8'hbd))))));
          reg331 <= wire324[(2'h2):(1'h1)];
        end
      else
        begin
          reg326 <= (($signed($unsigned(reg326)) ~^ wire320) && $signed((((+wire316) ?
                  reg331 : reg331[(3'h5):(2'h3)]) ?
              wire3 : wire2)));
          reg327 <= (~|$signed($signed(($unsigned(wire321) & $signed((8'hbb))))));
        end
      if (({reg327[(3'h4):(3'h4)]} >> reg328[(2'h3):(1'h1)]))
        begin
          if ($signed(wire321[(2'h3):(2'h2)]))
            begin
              reg332 <= (wire3[(5'h12):(3'h5)] + wire323);
            end
          else
            begin
              reg332 <= {wire321,
                  $unsigned(($unsigned(reg326[(1'h0):(1'h0)]) ?
                      (wire59 >>> $signed(wire3)) : wire2[(3'h7):(3'h4)]))};
              reg333 <= wire59[(3'h4):(3'h4)];
              reg334 <= (wire318[(5'h12):(5'h11)] ?
                  $signed($unsigned(wire320)) : (~&($signed($signed(wire321)) ?
                      $signed((wire0 - wire318)) : wire325[(3'h6):(3'h4)])));
            end
        end
      else
        begin
          reg332 <= (~(($unsigned((wire320 ? (7'h42) : wire321)) ?
              (reg334 ?
                  ((8'hb3) || wire316) : wire0[(4'hf):(4'hc)]) : (wire321[(4'h8):(2'h2)] >> wire1[(3'h5):(3'h5)])) >> ((wire324 ?
                  wire316 : $unsigned(wire320)) ?
              ($unsigned(reg334) ?
                  wire324[(3'h4):(2'h2)] : wire1[(4'hf):(3'h5)]) : {(wire324 >> wire2)})));
          reg333 <= reg329[(3'h5):(2'h3)];
        end
      reg335 <= wire323;
    end
  assign wire336 = reg330[(1'h0):(1'h0)];
  assign wire337 = wire316[(3'h5):(1'h0)];
  assign wire338 = ((&$signed(wire2[(4'hc):(1'h1)])) ?
                       wire1 : ((&({reg333} ?
                               $unsigned(wire321) : $unsigned(wire316))) ?
                           $signed((~(8'ha1))) : wire316));
  assign wire339 = wire2;
  module99 #() modinst341 (wire340, clk, wire336, wire324, reg333, reg332);
  assign wire342 = ($signed((wire338[(1'h1):(1'h1)] >= (^wire337))) && (wire324[(4'hb):(2'h3)] ?
                       ((~$unsigned((8'ha6))) ?
                           (~reg328[(3'h5):(2'h3)]) : $unsigned($unsigned(wire340))) : wire338));
  assign wire343 = ((&(~wire324[(3'h7):(1'h0)])) ?
                       reg333[(4'hc):(4'h8)] : $signed(($signed(reg330[(2'h3):(1'h1)]) ~^ (~|reg327[(4'he):(1'h1)]))));
  assign wire344 = {$signed($unsigned($signed((wire1 ? (8'haa) : wire340))))};
  assign wire345 = ($unsigned($unsigned(({reg331,
                       wire343} | $unsigned(wire3)))) >>> $unsigned(((wire344[(3'h5):(2'h2)] >> $signed(wire336)) >= reg328)));
  assign wire346 = ($unsigned((wire3[(2'h3):(2'h3)] ~^ ((reg332 ?
                       wire345 : wire316) <<< reg335[(5'h10):(4'hc)]))) == (7'h41));
endmodule

module module61
#(parameter param314 = {{{(((8'haf) >= (8'hb0)) ? ((8'h9e) | (8'hb3)) : (-(8'hbc))), (~{(8'hb8)})}}}, 
parameter param315 = ({param314} ? param314 : {(~((~&param314) ^~ (param314 ? param314 : param314))), {{(param314 ? param314 : param314)}, param314}}))
(y, clk, wire62, wire63, wire64, wire65, wire66);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire62;
  input wire [(5'h11):(1'h0)] wire63;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire [(5'h11):(1'h0)] wire65;
  input wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire313;
  wire signed [(2'h2):(1'h0)] wire312;
  wire signed [(3'h6):(1'h0)] wire311;
  wire signed [(5'h14):(1'h0)] wire309;
  wire [(4'hd):(1'h0)] wire232;
  wire [(4'he):(1'h0)] wire172;
  wire signed [(5'h12):(1'h0)] wire171;
  wire [(3'h4):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire169;
  wire [(5'h10):(1'h0)] wire168;
  wire signed [(5'h13):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire234;
  wire signed [(4'hc):(1'h0)] wire235;
  wire signed [(3'h4):(1'h0)] wire236;
  wire [(4'hf):(1'h0)] wire237;
  wire [(4'hb):(1'h0)] wire238;
  wire signed [(5'h15):(1'h0)] wire239;
  wire signed [(2'h3):(1'h0)] wire240;
  wire [(4'hc):(1'h0)] wire241;
  wire [(4'ha):(1'h0)] wire242;
  wire [(5'h12):(1'h0)] wire268;
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg166 = (1'h0);
  reg [(2'h2):(1'h0)] reg167 = (1'h0);
  assign y = {wire313,
                 wire312,
                 wire311,
                 wire309,
                 wire232,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire149,
                 wire97,
                 wire234,
                 wire235,
                 wire236,
                 wire237,
                 wire238,
                 wire239,
                 wire240,
                 wire241,
                 wire242,
                 wire268,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 (1'h0)};
  module67 #() modinst98 (.wire70(wire66), .wire72(wire64), .wire68(wire63), .wire69(wire62), .wire71(wire65), .y(wire97), .clk(clk));
  module99 #() modinst150 (wire149, clk, wire64, wire62, wire66, wire65);
  always
    @(posedge clk) begin
      reg151 <= wire64[(4'h8):(1'h1)];
      if ($unsigned(($unsigned({(wire64 > reg151), $signed((8'hb9))}) ?
          $unsigned($signed($unsigned(wire65))) : $unsigned((reg151[(3'h4):(1'h0)] << $signed(wire65))))))
        begin
          if (wire63[(2'h3):(1'h0)])
            begin
              reg152 <= wire62;
              reg153 <= (~^((~&(reg152 ?
                  wire63 : $unsigned(wire97))) <<< wire65[(4'hf):(3'h6)]));
            end
          else
            begin
              reg152 <= {((reg151[(3'h4):(1'h0)] <<< (~^(&wire64))) ?
                      {{$signed((8'hb5))},
                          (&$unsigned(wire64))} : $unsigned(((+wire65) <<< wire64[(4'hb):(2'h2)]))),
                  ($unsigned(reg153) - (-($signed(wire149) <<< (7'h43))))};
              reg153 <= reg151;
            end
        end
      else
        begin
          if (((wire149 <<< (&($signed(wire62) ?
                  wire149[(4'ha):(4'h8)] : (+wire66)))) ?
              ($signed($unsigned($signed((8'ha4)))) ?
                  (wire63[(2'h3):(2'h2)] ~^ {$signed(reg153)}) : wire64) : reg153[(3'h6):(1'h1)]))
            begin
              reg152 <= (!$signed((!$unsigned($signed(reg153)))));
              reg153 <= $unsigned((!($unsigned($unsigned(wire66)) <<< $unsigned((reg153 ?
                  wire64 : reg152)))));
              reg154 <= $signed((&wire63[(2'h2):(2'h2)]));
            end
          else
            begin
              reg152 <= (8'hb7);
              reg153 <= {(+(+$unsigned((-wire65)))), (wire97 * (!wire65))};
              reg154 <= $signed(wire62[(4'he):(3'h4)]);
            end
          reg155 <= $unsigned(($unsigned(((wire149 && (8'ha1)) ?
                  wire63 : wire64)) ?
              {(wire149[(4'hd):(4'hb)] + wire97)} : $signed({$signed(reg154)})));
          reg156 <= wire97;
          if ((!reg152))
            begin
              reg157 <= {reg154};
              reg158 <= ((^~$signed(wire149)) ~^ $signed((((reg153 || reg154) ?
                      (~^wire64) : wire97[(5'h11):(1'h0)]) ?
                  ({wire63} | $signed(wire66)) : ((&wire66) && wire65[(4'hd):(4'h9)]))));
            end
          else
            begin
              reg157 <= $unsigned($signed($unsigned(wire149)));
              reg158 <= (((8'h9c) ?
                      $unsigned($signed($unsigned(reg153))) : reg151) ?
                  wire65 : wire63[(1'h1):(1'h0)]);
              reg159 <= {wire66,
                  $signed((reg158 ? wire149 : {(wire97 ? reg154 : wire97)}))};
              reg160 <= $signed($unsigned(wire62));
            end
          if (({wire66} ?
              $signed((+wire149[(4'ha):(3'h5)])) : $signed((&reg159))))
            begin
              reg161 <= ((reg154[(3'h5):(3'h4)] ?
                      ($unsigned($signed(reg154)) ?
                          wire64[(5'h11):(2'h3)] : $signed((|reg151))) : $signed(((reg160 > (7'h41)) ?
                          (&wire62) : (!wire149)))) ?
                  {wire66[(3'h7):(3'h4)]} : {(~^((wire66 ? wire64 : reg155) ?
                          $unsigned(reg153) : wire65)),
                      (((^~reg153) ~^ wire62[(5'h10):(3'h4)]) ?
                          {(reg157 || wire64),
                              $unsigned(wire66)} : wire62[(4'hb):(3'h7)])});
              reg162 <= $signed(wire62);
              reg163 <= reg155;
            end
          else
            begin
              reg161 <= $signed($unsigned(wire97[(4'hd):(4'ha)]));
              reg162 <= {(reg158[(5'h10):(3'h7)] ? reg153 : wire63)};
              reg163 <= ($unsigned(($unsigned((8'hbe)) ?
                  wire63 : wire64[(2'h2):(2'h2)])) & $unsigned(((((8'hae) ~^ (8'had)) != ((8'haa) ?
                  wire64 : reg160)) * ($unsigned(wire97) == $signed((8'hb3))))));
              reg164 <= (|(~wire63));
              reg165 <= {((reg160 || (&reg155)) ?
                      (|(wire66 ?
                          $signed(wire66) : (reg164 ?
                              reg161 : wire97))) : reg164),
                  $unsigned(wire65)};
            end
        end
      reg166 <= $unsigned({reg152, reg159});
      reg167 <= (((^~(~^$unsigned(reg157))) ^ reg165) ?
          (~|(((|reg163) || $unsigned(reg154)) ~^ ($unsigned(reg163) || {wire65}))) : reg156[(1'h1):(1'h0)]);
    end
  assign wire168 = reg159[(4'h8):(4'h8)];
  assign wire169 = ((!$unsigned($signed($unsigned(reg162)))) ?
                       reg156[(1'h1):(1'h0)] : reg154[(3'h6):(3'h4)]);
  assign wire170 = (((($signed(wire66) ? (wire65 & (8'hab)) : reg165) ?
                           $signed((!wire64)) : (~^$signed((8'haa)))) >>> reg158[(2'h3):(1'h0)]) ?
                       reg158[(4'h9):(2'h2)] : (reg155[(1'h0):(1'h0)] << wire64));
  assign wire171 = $unsigned(wire170[(1'h0):(1'h0)]);
  assign wire172 = (^reg154);
  module173 #() modinst233 (wire232, clk, reg154, wire168, reg156, reg157);
  assign wire234 = ({reg159, reg164} == wire63[(1'h1):(1'h1)]);
  assign wire235 = reg155[(3'h6):(2'h3)];
  assign wire236 = (~&$unsigned((($unsigned(reg164) * $unsigned(reg153)) ?
                       (8'hb9) : $unsigned(reg161[(2'h3):(2'h2)]))));
  assign wire237 = (^$signed({(((8'ha5) ? reg156 : wire64) ?
                           (reg155 ? (7'h42) : reg154) : (reg162 >> reg159)),
                       reg163[(4'hc):(3'h6)]}));
  assign wire238 = ((|$unsigned(($unsigned(reg156) ?
                           $unsigned(wire237) : wire234[(2'h2):(1'h1)]))) ?
                       $unsigned((|(&(wire64 ?
                           (7'h40) : reg154)))) : reg158[(4'hd):(4'h9)]);
  assign wire239 = (((((~reg159) <<< reg159[(4'h8):(1'h1)]) & $unsigned((+reg163))) << ((wire232 ?
                               (~reg157) : {(8'hba)}) ?
                           ((reg157 + wire236) ?
                               $unsigned(reg155) : (8'h9f)) : $unsigned(reg159[(4'hf):(3'h6)]))) ?
                       $signed(reg166[(1'h0):(1'h0)]) : $unsigned(wire169));
  assign wire240 = $signed($signed({((reg166 == (8'ha0)) <= $signed(wire170)),
                       ({reg157, wire172} ? reg151 : (!(8'hb4)))}));
  assign wire241 = (^(($unsigned((wire97 >> reg153)) ?
                       ((&wire168) >= (^reg163)) : $signed(wire168[(4'h8):(1'h0)])) | $signed($unsigned($signed(reg155)))));
  assign wire242 = $signed($unsigned($unsigned(reg160[(3'h4):(1'h0)])));
  module243 #() modinst269 (wire268, clk, wire172, wire62, wire63, reg162);
  module270 #() modinst310 (.clk(clk), .wire275(reg166), .wire274(wire238), .wire273(wire63), .wire271(wire66), .wire272(wire169), .y(wire309));
  assign wire311 = {(wire232 < $unsigned(wire237[(3'h7):(3'h4)]))};
  assign wire312 = reg156[(4'hf):(4'h8)];
  assign wire313 = reg153[(2'h3):(1'h1)];
endmodule

module module4
#(parameter param57 = ({({((8'hbc) ? (8'haf) : (8'hba)), ((8'haa) | (8'hb7))} ^~ (&((8'hb2) ? (7'h40) : (8'ha6))))} + (!({(7'h43)} ? ((~|(8'hb6)) ? (8'had) : (8'hbd)) : (8'hb7)))), 
parameter param58 = (((^{(param57 & param57)}) ? {(((7'h41) - param57) >> (param57 - (8'ha0))), (param57 > (^~param57))} : param57) ? param57 : (({{param57}} >> ((param57 && param57) >= (param57 ? param57 : param57))) ? {param57, (param57 ? {param57, param57} : (param57 | param57))} : (((param57 ? param57 : param57) + (param57 ? param57 : param57)) ? (+param57) : ((param57 ? param57 : param57) ? (param57 ~^ (8'ha8)) : param57)))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire21,
                 wire20,
                 wire18,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg19,
                 (1'h0)};
  assign wire10 = wire9;
  assign wire11 = (($signed($signed($unsigned(wire9))) ?
                      (8'hbb) : $unsigned((wire10[(3'h5):(2'h3)] ?
                          (&wire9) : $unsigned(wire9)))) > $signed($unsigned((wire9[(3'h5):(3'h5)] ~^ (~^(8'hae))))));
  assign wire12 = wire9[(1'h0):(1'h0)];
  assign wire13 = (+($unsigned((^~((8'hac) ?
                      wire9 : wire12))) < (^(wire7[(2'h3):(2'h2)] ?
                      $signed(wire10) : wire5[(4'hb):(1'h0)]))));
  always
    @(posedge clk) begin
      reg14 <= {((^~(wire5[(4'hd):(4'hb)] > wire7)) ?
              wire11 : wire13[(5'h10):(4'ha)]),
          wire6};
      reg15 <= ({(wire7 ?
                  wire5 : ($signed((7'h44)) ?
                      (wire11 >>> wire9) : $unsigned(wire13)))} ?
          $unsigned($unsigned(wire13[(4'he):(4'hc)])) : $signed($signed({$unsigned(wire8)})));
      reg16 <= wire5;
      reg17 <= $unsigned((((reg16 ^ (reg14 ^ wire7)) ?
              (wire7[(4'h9):(1'h0)] * (wire13 + reg15)) : $unsigned($unsigned(wire13))) ?
          reg16[(4'ha):(3'h6)] : wire8[(3'h6):(1'h0)]));
    end
  assign wire18 = (|wire13);
  always
    @(posedge clk) begin
      reg19 <= $signed({(&(~^(wire9 * reg16))), {$unsigned($signed(wire9))}});
    end
  assign wire20 = (~$unsigned(wire13));
  assign wire21 = wire13;
  module22 #() modinst53 (.wire26(reg16), .wire24(wire21), .wire23(wire20), .wire27(wire10), .y(wire52), .clk(clk), .wire25(wire6));
  assign wire54 = (reg15 ?
                      $unsigned($signed($unsigned((reg19 ?
                          (8'hb9) : reg17)))) : (wire13[(4'he):(3'h5)] != wire13[(5'h10):(5'h10)]));
  assign wire55 = $unsigned($signed($unsigned({{(8'h9c), wire7},
                      wire52[(2'h3):(2'h2)]})));
  assign wire56 = $unsigned(($signed(((!reg17) ?
                          wire54 : (wire18 >> (7'h40)))) ?
                      ($signed(reg14) >> ($signed(wire18) << $signed(wire20))) : ({{reg17,
                                  wire9}} ?
                          $unsigned((reg16 ? reg14 : wire55)) : (8'ha8))));
endmodule

module module22
#(parameter param50 = (!(!({((8'hb8) != (8'h9e)), ((8'hb9) ? (8'ha0) : (8'hb7))} ? ({(8'hbc)} ? ((8'ha7) ? (8'had) : (8'had)) : ((8'hb9) ? (8'ha1) : (8'hbd))) : (!(-(8'hba)))))), 
parameter param51 = param50)
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire signed [(2'h3):(1'h0)] wire25;
  input wire [(3'h4):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 reg34,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= wire24;
      reg29 <= $unsigned(({((!reg28) & wire24)} ?
          wire26[(3'h7):(3'h6)] : wire26));
      reg30 <= ($signed($signed(wire24)) ? reg28 : (wire24 >= reg29));
      reg31 <= $unsigned($unsigned((~$signed((reg29 ? (8'ha4) : wire24)))));
    end
  assign wire32 = {($signed(($unsigned(reg30) ?
                          (wire25 ^ wire26) : $signed(reg31))) != wire24),
                      (&((reg31 || (+reg30)) ?
                          $signed(reg30) : reg29[(4'hc):(4'ha)]))};
  assign wire33 = $unsigned((wire23[(1'h0):(1'h0)] < {(^~$unsigned(wire25))}));
  always
    @(posedge clk) begin
      reg34 <= {(~|($signed((+reg30)) ?
              ($signed(wire27) || wire27[(2'h2):(2'h2)]) : reg28[(3'h7):(3'h6)])),
          (((~&(8'hb6)) ? {$signed((7'h41)), (|wire32)} : $unsigned((8'haa))) ?
              $unsigned(($signed(reg31) >>> $unsigned((8'hac)))) : $signed(((!wire24) ?
                  $signed(wire26) : reg28)))};
    end
  assign wire35 = (-(wire25[(1'h0):(1'h0)] ?
                      (-$signed($unsigned(reg28))) : ((~|$signed(wire33)) != reg31)));
  assign wire36 = {{($signed({wire24}) ?
                              (^$unsigned(reg29)) : (wire32 * (&wire33))),
                          (wire32 ? (^~wire24) : wire27[(3'h4):(1'h1)])},
                      ((~^$unsigned(wire24)) ?
                          ((((7'h43) ? (8'hb5) : reg28) ^~ {wire33, reg28}) ?
                              (wire23[(4'h8):(1'h1)] ?
                                  $unsigned(reg28) : wire32) : wire24[(1'h0):(1'h0)]) : {(&reg30),
                              reg31[(1'h1):(1'h1)]})};
  assign wire37 = reg30;
  assign wire38 = ($signed({(reg28 ?
                          reg29 : {(8'ha6)})}) != {((~wire37[(1'h0):(1'h0)]) ?
                          (reg29[(4'he):(4'hd)] ?
                              $signed(wire33) : {reg28,
                                  wire23}) : (!(~^wire37)))});
  assign wire39 = ((wire25 ? reg34[(2'h3):(2'h3)] : wire37) ?
                      $unsigned(wire37[(3'h5):(2'h3)]) : (wire35 + $signed(((^~reg34) ?
                          $unsigned(reg31) : $unsigned(wire38)))));
  assign wire40 = (wire26 ?
                      (wire37[(1'h0):(1'h0)] == $signed($signed($signed(reg34)))) : (((((8'hbf) ^~ reg28) * wire36[(2'h2):(1'h1)]) < $unsigned($unsigned((8'haa)))) != $signed($signed($signed(wire36)))));
  assign wire41 = wire33;
  assign wire42 = (!$signed((($unsigned(wire37) ?
                      {wire27} : (wire38 == wire40)) >= reg29[(3'h7):(3'h4)])));
  assign wire43 = ((wire42[(3'h4):(2'h2)] ?
                      $unsigned(wire32) : $unsigned(wire23)) ^~ $unsigned(wire26[(4'h9):(2'h2)]));
  assign wire44 = ($unsigned((!($unsigned(wire39) ?
                      $signed(wire41) : $unsigned((8'hb2))))) == {(($unsigned((8'h9c)) ~^ (wire35 ?
                              reg34 : reg30)) ?
                          $unsigned((wire39 >>> wire23)) : (~$signed(wire25)))});
  assign wire45 = $unsigned(wire27);
  assign wire46 = reg31;
  assign wire47 = $signed((wire46 ? wire35[(3'h5):(2'h2)] : (~wire27)));
  assign wire48 = (((!$signed(((8'hbb) < wire43))) ?
                          ($signed(wire39[(1'h0):(1'h0)]) ?
                              (|(wire45 >= wire40)) : (~(wire38 ?
                                  (8'ha4) : reg28))) : ((&(+wire37)) >>> {{wire24}})) ?
                      reg29[(4'ha):(2'h3)] : (wire38[(4'h8):(2'h3)] == (~&wire23[(2'h2):(1'h1)])));
  assign wire49 = $unsigned(wire44);
endmodule

module module270  (y, clk, wire275, wire274, wire273, wire272, wire271);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire275;
  input wire [(3'h6):(1'h0)] wire274;
  input wire [(5'h11):(1'h0)] wire273;
  input wire [(4'hd):(1'h0)] wire272;
  input wire [(4'hd):(1'h0)] wire271;
  wire [(5'h11):(1'h0)] wire308;
  wire signed [(5'h12):(1'h0)] wire307;
  wire [(5'h12):(1'h0)] wire306;
  wire signed [(2'h2):(1'h0)] wire305;
  wire [(4'h8):(1'h0)] wire304;
  wire [(4'ha):(1'h0)] wire303;
  wire [(5'h10):(1'h0)] wire302;
  reg [(2'h3):(1'h0)] reg301 = (1'h0);
  reg [(4'hd):(1'h0)] reg300 = (1'h0);
  reg [(4'h8):(1'h0)] reg299 = (1'h0);
  reg [(5'h15):(1'h0)] reg298 = (1'h0);
  reg [(4'he):(1'h0)] reg297 = (1'h0);
  reg [(4'hb):(1'h0)] reg296 = (1'h0);
  reg [(5'h13):(1'h0)] reg295 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg294 = (1'h0);
  reg [(4'h9):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg292 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg291 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg290 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg289 = (1'h0);
  reg [(2'h3):(1'h0)] reg288 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg287 = (1'h0);
  reg [(5'h12):(1'h0)] reg286 = (1'h0);
  reg [(2'h2):(1'h0)] reg285 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg284 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg283 = (1'h0);
  reg [(5'h15):(1'h0)] reg282 = (1'h0);
  reg [(3'h6):(1'h0)] reg281 = (1'h0);
  reg [(5'h13):(1'h0)] reg280 = (1'h0);
  reg [(4'hf):(1'h0)] reg279 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg278 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg277 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg276 = (1'h0);
  assign y = {wire308,
                 wire307,
                 wire306,
                 wire305,
                 wire304,
                 wire303,
                 wire302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg276 <= $signed($unsigned(((wire273[(4'hf):(3'h6)] <= (8'hb1)) ?
          (wire273[(5'h10):(4'ha)] && (wire272 ^ (8'hbb))) : (wire274 || (^~wire271)))));
      reg277 <= (&(($unsigned($signed(wire274)) ?
          (((8'hbf) ? (8'ha2) : wire273) + (wire275 ?
              wire273 : wire274)) : {$signed(wire274)}) == (wire272[(4'h9):(2'h3)] ?
          wire274[(3'h4):(1'h0)] : wire273)));
      if ((8'ha4))
        begin
          reg278 <= (((wire272 ? wire271 : $unsigned((^~reg277))) ?
              (~^wire275[(1'h1):(1'h1)]) : wire271) << $signed(($unsigned($unsigned(reg277)) >>> (~&$unsigned(wire274)))));
          if (($signed(wire272[(4'ha):(4'ha)]) == (reg278 ?
              (wire275[(2'h3):(1'h0)] << $unsigned($signed(reg277))) : $unsigned(wire273[(4'h8):(2'h2)]))))
            begin
              reg279 <= (8'h9f);
              reg280 <= $signed(((($unsigned((8'h9c)) ?
                          (reg278 ? wire275 : (8'haa)) : $unsigned(wire274)) ?
                      $unsigned($unsigned((8'hb8))) : ((reg279 ?
                          wire271 : wire275) != $unsigned(wire275))) ?
                  reg276 : {({(8'h9d), wire274} ?
                          ((8'haf) + wire271) : reg276[(3'h5):(3'h4)])}));
              reg281 <= ((^~{$signed((wire274 + wire272)),
                  {(wire272 ? (8'hb4) : reg278)}}) && reg280[(4'h9):(4'h8)]);
              reg282 <= wire271[(4'h9):(3'h4)];
            end
          else
            begin
              reg279 <= reg280;
              reg280 <= $signed($unsigned(wire274[(3'h4):(1'h0)]));
              reg281 <= wire271;
              reg282 <= reg277[(1'h1):(1'h1)];
            end
          reg283 <= $unsigned($unsigned(wire274));
          if (reg280[(5'h12):(4'hc)])
            begin
              reg284 <= ((~&$signed((^{reg276, (8'hbd)}))) << wire275);
              reg285 <= ({reg282, $signed({(reg283 - wire271)})} > {((reg279 ?
                          {reg280} : reg284[(2'h3):(2'h3)]) ?
                      $signed((-reg283)) : reg283)});
            end
          else
            begin
              reg284 <= (reg282 ?
                  $signed((^wire271)) : (|(wire272 ?
                      ((reg284 ?
                          wire271 : reg281) < $unsigned(reg283)) : {(reg283 ?
                              reg279 : reg285),
                          (wire272 == reg276)})));
              reg285 <= (^~($unsigned(wire272) ?
                  $unsigned({((8'hb7) - reg285)}) : $signed(reg279)));
              reg286 <= ($unsigned((reg285[(1'h0):(1'h0)] >>> wire274[(3'h6):(3'h4)])) ?
                  reg277[(2'h2):(1'h1)] : reg276);
            end
        end
      else
        begin
          reg278 <= wire275[(2'h3):(1'h1)];
          reg279 <= $unsigned($signed((($signed(wire271) ?
                  (~|wire272) : (8'had)) ?
              (+(8'h9e)) : $signed((|reg276)))));
          reg280 <= $unsigned($unsigned((~(~$signed(reg276)))));
        end
      reg287 <= wire273;
    end
  always
    @(posedge clk) begin
      reg288 <= reg284[(4'hc):(3'h7)];
      if ($signed($signed($unsigned(($unsigned(reg282) ?
          reg279 : {reg276, (8'hb5)})))))
        begin
          reg289 <= {(((&(reg286 ^~ (8'hb9))) != ((reg284 ^~ wire275) ?
                  reg280[(4'hc):(2'h2)] : reg285)) * (($unsigned(wire271) || $signed(reg278)) >> ((reg286 ?
                      reg277 : reg282) ?
                  $unsigned(reg282) : (reg287 < wire275))))};
        end
      else
        begin
          reg289 <= (+$signed(reg288[(1'h0):(1'h0)]));
          reg290 <= (reg286 ?
              wire272[(2'h2):(1'h0)] : (!$signed(((!reg284) > (8'hbe)))));
          reg291 <= $unsigned({$signed($signed({reg289}))});
        end
      reg292 <= $signed($unsigned((reg283[(1'h1):(1'h0)] * {(-reg279)})));
      reg293 <= $unsigned((~&(wire272[(1'h1):(1'h0)] < reg277)));
      if (reg284[(1'h0):(1'h0)])
        begin
          reg294 <= (~|$unsigned((reg283[(1'h1):(1'h1)] ?
              $unsigned($signed(reg276)) : $unsigned($unsigned(reg292)))));
        end
      else
        begin
          reg294 <= reg286;
          reg295 <= (reg286[(1'h0):(1'h0)] <<< $unsigned(({$unsigned((8'ha2))} && ((reg282 ?
                  wire275 : reg276) ?
              reg283 : (reg294 != (8'hb9))))));
          reg296 <= (wire274[(3'h5):(1'h0)] <= $unsigned($unsigned(reg283)));
          if ($unsigned(((~^$unsigned($unsigned(reg279))) <= reg280[(2'h2):(1'h1)])))
            begin
              reg297 <= $signed(reg289[(2'h2):(1'h1)]);
              reg298 <= ({$signed((reg287 ?
                      (!(8'hb8)) : (wire275 + (8'hac))))} != (((^wire272[(3'h6):(2'h2)]) || $unsigned($signed(wire271))) <<< (^~reg287[(4'ha):(2'h2)])));
              reg299 <= (reg290 ?
                  $signed($signed($unsigned(wire274))) : $signed($unsigned((reg283 <<< reg276[(3'h5):(1'h0)]))));
              reg300 <= $signed(reg283[(2'h3):(1'h0)]);
              reg301 <= ($unsigned(reg296[(1'h1):(1'h1)]) < wire272[(4'ha):(3'h6)]);
            end
          else
            begin
              reg297 <= (reg285[(2'h2):(1'h1)] > $signed($unsigned($signed(reg278[(3'h5):(3'h5)]))));
              reg298 <= reg290;
              reg299 <= {{wire273[(3'h4):(2'h2)]}};
              reg300 <= (((-(|reg282)) ?
                  (({reg288, reg298} ? (^wire275) : $unsigned(wire274)) ?
                      (~|((8'hb0) ?
                          reg301 : reg286)) : $signed($signed(reg291))) : $signed(((wire272 ?
                          reg301 : reg285) ?
                      {reg294} : reg292[(4'h8):(1'h0)]))) > ($signed(((reg281 ?
                  reg299 : reg291) >= (reg287 ?
                  reg296 : (8'haf)))) == (reg281 >= reg291[(2'h2):(1'h0)])));
            end
        end
    end
  assign wire302 = reg280[(3'h7):(1'h0)];
  assign wire303 = reg298;
  assign wire304 = $unsigned((&(reg279 ? reg280 : reg299)));
  assign wire305 = $signed($unsigned((~|reg292)));
  assign wire306 = reg296[(3'h5):(1'h0)];
  assign wire307 = {(~{$signed((wire302 ? reg289 : wire271)),
                           $unsigned((reg287 ? (7'h42) : reg285))})};
  assign wire308 = $signed({$unsigned((^(~|reg293))), reg292});
endmodule

module module243
#(parameter param266 = {(((8'h9d) ? (^~((8'hb6) ? (8'ha3) : (8'had))) : (((8'hae) >> (8'hb5)) ? (-(8'h9d)) : {(7'h42)})) >> (~&(~&((8'ha1) ? (7'h44) : (8'hab)))))}, 
parameter param267 = param266)
(y, clk, wire247, wire246, wire245, wire244);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire247;
  input wire [(3'h5):(1'h0)] wire246;
  input wire [(4'hf):(1'h0)] wire245;
  input wire signed [(5'h10):(1'h0)] wire244;
  wire signed [(3'h4):(1'h0)] wire265;
  wire [(4'hb):(1'h0)] wire264;
  wire signed [(2'h3):(1'h0)] wire263;
  wire [(4'hb):(1'h0)] wire262;
  reg signed [(4'hb):(1'h0)] reg261 = (1'h0);
  reg [(4'hd):(1'h0)] reg260 = (1'h0);
  reg [(4'hb):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg258 = (1'h0);
  reg [(4'hd):(1'h0)] reg257 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg256 = (1'h0);
  reg signed [(4'he):(1'h0)] reg255 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg254 = (1'h0);
  reg [(4'hc):(1'h0)] reg253 = (1'h0);
  reg [(4'h9):(1'h0)] reg252 = (1'h0);
  reg [(2'h2):(1'h0)] reg251 = (1'h0);
  reg [(4'hb):(1'h0)] reg250 = (1'h0);
  reg [(5'h15):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg248 = (1'h0);
  assign y = {wire265,
                 wire264,
                 wire263,
                 wire262,
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
                 reg249,
                 reg248,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~{wire247[(1'h1):(1'h1)]}))
        begin
          reg248 <= wire247;
          if (($unsigned($unsigned(wire244[(4'h9):(1'h0)])) == $unsigned($signed(($unsigned(wire247) >>> (wire246 || wire245))))))
            begin
              reg249 <= (reg248[(4'h8):(1'h1)] ?
                  $signed((((wire244 ? (8'h9e) : wire246) == $signed(wire246)) ?
                      (wire247[(2'h2):(1'h1)] != (+wire244)) : $unsigned(reg248[(2'h2):(1'h1)]))) : $unsigned(({$signed((7'h40))} ?
                      ((reg248 ^ wire247) && (|wire247)) : wire246)));
              reg250 <= wire244[(3'h7):(1'h0)];
              reg251 <= $unsigned($unsigned($unsigned($signed((!wire247)))));
              reg252 <= (~|$signed((wire244[(1'h0):(1'h0)] ^~ {$unsigned(reg251)})));
              reg253 <= $signed((($unsigned((8'h9e)) == $unsigned(wire247)) >= $unsigned(((reg252 != reg250) ?
                  (reg248 ? reg249 : reg248) : {(8'hb6)}))));
            end
          else
            begin
              reg249 <= $signed(reg252[(2'h2):(2'h2)]);
              reg250 <= ({((reg253[(3'h7):(3'h4)] == reg253[(2'h2):(1'h0)]) ?
                          ($unsigned(reg248) && (+reg250)) : reg252[(4'h9):(1'h0)]),
                      (-reg249[(1'h1):(1'h1)])} ?
                  reg251[(2'h2):(1'h1)] : $signed((((wire246 >> wire247) == $unsigned(reg251)) ~^ $unsigned(((8'had) >= reg253)))));
              reg251 <= (^~$unsigned((~&{reg251, (!wire246)})));
            end
          if (wire246[(3'h4):(3'h4)])
            begin
              reg254 <= (wire245 ?
                  $signed(wire245) : $unsigned(reg248[(1'h1):(1'h0)]));
            end
          else
            begin
              reg254 <= wire246[(1'h0):(1'h0)];
              reg255 <= wire246;
              reg256 <= $signed((wire246[(2'h3):(1'h1)] ?
                  ((-(reg248 | reg251)) && $signed((^~reg252))) : {{((8'hbb) ?
                              (8'hb2) : wire244),
                          (~(8'h9c))}}));
              reg257 <= (reg252[(1'h1):(1'h1)] ^~ ($unsigned(($unsigned(reg253) >= (^~wire247))) ?
                  {$unsigned((wire244 ? reg255 : reg248))} : reg252));
            end
          reg258 <= ($signed(reg257) || $signed({$signed($unsigned(reg254)),
              (!(reg251 + (8'hb3)))}));
          reg259 <= (~(((-(reg255 > reg250)) ?
              $unsigned(reg253) : {((8'ha6) ? reg251 : wire247),
                  (|wire244)}) >= {(8'h9e)}));
        end
      else
        begin
          reg248 <= ($signed({$signed((reg251 ? reg256 : wire247)),
              {(reg252 != reg256), $unsigned(reg253)}}) && reg248);
          if (reg252)
            begin
              reg249 <= $unsigned($signed(reg252));
              reg250 <= ({wire244[(4'hc):(4'h9)],
                  ((wire246[(3'h5):(1'h1)] >= $signed(reg256)) ?
                      (wire244[(3'h5):(1'h0)] && (~&reg258)) : reg256)} & wire246);
              reg251 <= {$unsigned(wire245[(1'h0):(1'h0)]), reg253};
              reg252 <= $signed($signed($unsigned($signed($signed((8'hbc))))));
              reg253 <= {((~|(wire245[(4'hd):(1'h1)] ?
                          reg249[(1'h0):(1'h0)] : (reg250 ?
                              wire246 : wire246))) ?
                      $unsigned(wire247) : wire246),
                  reg257};
            end
          else
            begin
              reg249 <= $signed(reg251[(1'h1):(1'h1)]);
              reg250 <= $signed($unsigned((((reg259 ?
                  (8'ha2) : reg248) ^~ $signed(wire246)) == wire246[(2'h3):(1'h1)])));
              reg251 <= ($unsigned(reg252[(3'h7):(1'h1)]) ?
                  {$unsigned(((~reg255) ? $unsigned(reg255) : (~^(8'had)))),
                      $unsigned($unsigned($unsigned(wire246)))} : (8'hab));
              reg252 <= reg259[(3'h6):(3'h6)];
              reg253 <= (+$signed(reg251[(1'h1):(1'h1)]));
            end
          reg254 <= $signed($signed(((!$unsigned(reg253)) ?
              $signed($unsigned(reg249)) : reg250)));
          reg255 <= (((((reg252 || wire247) > wire244[(4'he):(3'h6)]) && (-reg257[(3'h6):(1'h1)])) || reg252[(2'h2):(1'h1)]) ?
              $signed((reg249[(5'h13):(4'h8)] ?
                  $signed(wire245) : (!$unsigned((8'h9c))))) : $unsigned(((reg252[(3'h6):(2'h3)] ?
                  (reg249 ?
                      (8'ha7) : wire246) : reg248) ~^ reg255[(4'h9):(3'h7)])));
          if ($signed(reg259))
            begin
              reg256 <= {reg252[(1'h0):(1'h0)],
                  {((8'hb8) ?
                          $signed({reg254}) : $signed(reg256[(1'h1):(1'h0)]))}};
              reg257 <= ($unsigned((!reg254)) > $unsigned((($signed((8'hbc)) ?
                  (wire246 ?
                      wire245 : wire247) : (|(8'ha6))) != $unsigned($unsigned(wire247)))));
              reg258 <= $unsigned(wire245[(2'h2):(1'h0)]);
              reg259 <= reg254;
            end
          else
            begin
              reg256 <= ((~($unsigned(reg255) ~^ (~&wire244))) ?
                  $unsigned({((&wire244) ? reg256 : (reg259 | reg249)),
                      $unsigned((!reg258))}) : ({(8'hb9), reg252} ?
                      {{{wire244},
                              (reg254 + (8'hb9))}} : (-$unsigned(reg258[(4'hc):(4'ha)]))));
              reg257 <= reg249;
              reg258 <= $signed((wire244 ?
                  (+(-{wire247, wire246})) : $unsigned((!{(7'h41)}))));
              reg259 <= reg253[(4'h8):(3'h4)];
            end
        end
      reg260 <= $signed((~^(~|$unsigned((reg251 ? (8'hb3) : reg258)))));
      reg261 <= ((8'h9d) ?
          reg260[(2'h2):(1'h0)] : $signed($unsigned((~|(wire247 ?
              reg255 : reg248)))));
    end
  assign wire262 = (reg249[(4'hf):(4'h9)] & $signed({$signed((~wire245))}));
  assign wire263 = reg250[(4'ha):(2'h2)];
  assign wire264 = ({$unsigned(((^reg251) <<< {wire246, reg257})),
                       $unsigned(($signed(reg258) ?
                           wire246 : reg248))} > $unsigned(reg251[(1'h0):(1'h0)]));
  assign wire265 = (($unsigned({(~&wire246)}) ?
                       $signed((reg257[(2'h2):(1'h1)] ?
                           $signed(reg250) : $signed(reg261))) : {reg254[(2'h2):(2'h2)],
                           reg259[(3'h6):(3'h5)]}) >= $signed(reg254));
endmodule

module module173
#(parameter param231 = ((((+((8'ha4) >>> (8'ha4))) == (((8'hae) << (8'h9d)) ? ((8'h9c) >= (8'had)) : ((8'hbb) <<< (8'hbd)))) ? ((~^(~^(8'hb6))) ? {(^(7'h44)), {(7'h42)}} : ((~(8'ha7)) < ((8'ha0) >> (8'hbe)))) : (|(((7'h41) ? (8'h9e) : (7'h40)) ? ((7'h41) ? (7'h40) : (8'hb4)) : {(7'h43), (8'hb4)}))) ? {(({(8'hb2)} ? ((8'ha7) ? (8'hbe) : (8'had)) : ((8'hbc) * (8'hab))) > ((~^(8'ha3)) * ((8'h9c) <= (7'h41)))), ((((8'hb3) != (8'ha6)) & ((8'ha5) <<< (8'ha4))) && ((-(8'hb4)) ? ((8'h9e) && (8'ha5)) : ((8'ha9) << (8'hac))))} : (~((((7'h41) ? (8'hb1) : (8'h9e)) ^ (~&(8'hb7))) >= ((8'hbb) & ((7'h41) ? (8'had) : (8'hb2)))))))
(y, clk, wire177, wire176, wire175, wire174);
  output wire [(32'h283):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire177;
  input wire signed [(2'h3):(1'h0)] wire176;
  input wire signed [(5'h11):(1'h0)] wire175;
  input wire signed [(5'h15):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire230;
  wire signed [(4'hc):(1'h0)] wire229;
  wire [(5'h11):(1'h0)] wire228;
  wire signed [(5'h11):(1'h0)] wire227;
  wire signed [(4'hd):(1'h0)] wire226;
  wire [(4'hc):(1'h0)] wire211;
  wire [(3'h6):(1'h0)] wire210;
  wire signed [(4'h8):(1'h0)] wire209;
  wire signed [(5'h13):(1'h0)] wire208;
  wire signed [(5'h15):(1'h0)] wire207;
  wire [(3'h6):(1'h0)] wire206;
  wire signed [(5'h14):(1'h0)] wire205;
  wire signed [(4'hf):(1'h0)] wire204;
  wire signed [(4'hc):(1'h0)] wire203;
  wire signed [(5'h15):(1'h0)] wire202;
  wire [(4'hf):(1'h0)] wire181;
  wire [(4'hc):(1'h0)] wire180;
  wire [(5'h13):(1'h0)] wire179;
  wire [(3'h5):(1'h0)] wire178;
  reg [(5'h11):(1'h0)] reg225 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg224 = (1'h0);
  reg [(4'ha):(1'h0)] reg223 = (1'h0);
  reg [(3'h7):(1'h0)] reg222 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg220 = (1'h0);
  reg [(5'h10):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg218 = (1'h0);
  reg [(5'h15):(1'h0)] reg217 = (1'h0);
  reg [(4'hc):(1'h0)] reg216 = (1'h0);
  reg [(5'h11):(1'h0)] reg215 = (1'h0);
  reg signed [(4'he):(1'h0)] reg214 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg213 = (1'h0);
  reg [(4'hc):(1'h0)] reg212 = (1'h0);
  reg [(5'h12):(1'h0)] reg201 = (1'h0);
  reg [(5'h13):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(4'hc):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg194 = (1'h0);
  reg [(3'h4):(1'h0)] reg193 = (1'h0);
  reg [(3'h7):(1'h0)] reg192 = (1'h0);
  reg [(4'he):(1'h0)] reg191 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(4'he):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg187 = (1'h0);
  reg [(4'h9):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(3'h7):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  assign y = {wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 (1'h0)};
  assign wire178 = wire176[(2'h3):(2'h3)];
  assign wire179 = ($unsigned(({(~&wire178), {wire175, wire177}} ?
                           (!$unsigned(wire174)) : (wire177[(2'h3):(1'h0)] || (&(8'hbc))))) ?
                       $signed({wire177, wire175[(4'h9):(2'h2)]}) : wire176);
  assign wire180 = ({($unsigned(((8'ha4) ? wire175 : wire174)) ?
                           $unsigned((wire176 ^ wire178)) : wire178[(3'h5):(1'h0)])} >>> (^((wire176 ?
                           (!wire175) : $unsigned(wire176)) ?
                       (wire179 ?
                           (wire174 ?
                               wire176 : wire175) : {wire175}) : $signed($signed(wire175)))));
  assign wire181 = ($unsigned(wire177[(2'h3):(2'h2)]) | (7'h40));
  always
    @(posedge clk) begin
      if ((({((wire180 ? wire174 : wire177) * (^wire181))} ?
          (wire176 ?
              ((8'hbd) <<< (wire177 <<< wire174)) : (wire179[(4'ha):(3'h6)] ?
                  (wire174 ? wire174 : wire178) : {(7'h41),
                      wire180})) : $unsigned($signed((wire176 <= wire178)))) & (8'hbe)))
        begin
          reg182 <= (wire180 == ((|$signed(((8'hb5) | wire181))) || (wire178 ?
              wire180[(4'h8):(2'h2)] : ($unsigned(wire174) << (wire178 ?
                  wire176 : wire178)))));
          if (wire176)
            begin
              reg183 <= wire178;
              reg184 <= (~&((wire178 != ((reg183 >>> wire178) ?
                      $unsigned(wire174) : (&wire178))) ?
                  $signed((wire178[(2'h2):(2'h2)] & reg182[(2'h2):(1'h1)])) : wire174));
              reg185 <= wire174[(1'h0):(1'h0)];
              reg186 <= $unsigned((8'h9d));
              reg187 <= wire174;
            end
          else
            begin
              reg183 <= wire177[(2'h2):(2'h2)];
              reg184 <= $unsigned({(((reg184 <<< reg183) ?
                      $signed(wire176) : reg187[(4'hc):(1'h1)]) << ((+reg183) ?
                      reg185 : {wire179}))});
            end
          reg188 <= $signed(({(!wire179), wire176[(1'h1):(1'h0)]} <= {wire175,
              (^~(~&reg185))}));
        end
      else
        begin
          reg182 <= reg188;
          if (wire180)
            begin
              reg183 <= reg188;
              reg184 <= reg184;
              reg185 <= {(!wire179),
                  $unsigned((wire178 ~^ (~|$unsigned(wire179))))};
            end
          else
            begin
              reg183 <= $unsigned(((^(~&(~&wire175))) ?
                  wire174[(4'he):(4'h9)] : (|$unsigned(reg182))));
              reg184 <= wire178;
              reg185 <= {reg188, $signed((~|$signed(reg185)))};
              reg186 <= $signed(reg185);
            end
          reg187 <= (^$signed((|(~^(wire178 ? reg183 : wire177)))));
        end
      if ($unsigned($signed((&$unsigned((+reg186))))))
        begin
          reg189 <= wire175;
        end
      else
        begin
          reg189 <= wire181;
          reg190 <= $unsigned($unsigned((({(8'haf),
              reg187} >> $signed(reg189)) >= (~(reg186 ? wire181 : wire181)))));
          reg191 <= $unsigned((($signed((8'hbb)) ?
              ((reg183 | wire181) ?
                  (reg183 != wire179) : $unsigned(reg186)) : ((wire177 ?
                      reg183 : (8'hb3)) ?
                  {wire179,
                      wire176} : (wire178 < reg190))) ^ (~&{$unsigned(reg183),
              ((8'hba) ? wire181 : reg187)})));
          reg192 <= $unsigned((~|$signed((wire178[(2'h2):(1'h0)] >> wire181))));
        end
      reg193 <= $unsigned(reg192);
      if (((~|reg184) ?
          wire174[(5'h10):(3'h6)] : $unsigned(($unsigned({reg188}) ?
              reg190[(1'h0):(1'h0)] : $unsigned((reg188 ? reg186 : wire179))))))
        begin
          reg194 <= {($unsigned((&(|reg186))) ?
                  (reg183 | ({(8'hab)} << (wire178 ?
                      reg192 : (8'hb8)))) : reg183)};
        end
      else
        begin
          reg194 <= (^~reg183[(1'h0):(1'h0)]);
          reg195 <= ((~{($unsigned((8'h9f)) ?
                  (~|wire175) : (!reg194))}) <= (!$unsigned(((&reg192) ?
              $unsigned(reg192) : ((8'had) >>> (8'ha4))))));
          reg196 <= $unsigned(reg195);
          if ($signed((8'ha4)))
            begin
              reg197 <= ($signed((^~wire176[(2'h3):(1'h1)])) ~^ $unsigned(reg189));
              reg198 <= (|$unsigned($signed((!{reg185}))));
              reg199 <= {(($signed((reg187 ?
                      reg194 : (8'hb8))) != ($signed(wire178) != (reg185 ?
                      reg186 : reg182))) & $signed((reg195 ?
                      wire181[(3'h7):(1'h0)] : $signed(reg196)))),
                  $unsigned(wire180)};
              reg200 <= {(reg198 ?
                      (~$signed(wire174)) : $unsigned(((+(8'hb3)) ?
                          wire175 : (reg188 ? reg190 : reg199)))),
                  ((reg196[(1'h1):(1'h0)] & (~^reg194[(3'h5):(1'h0)])) != ($unsigned(wire175) ?
                      $signed((|reg182)) : ($signed((8'h9f)) ?
                          (~|wire180) : reg187)))};
            end
          else
            begin
              reg197 <= (reg194 | (({wire176} < $unsigned($signed(wire174))) ?
                  $unsigned(reg186) : (($unsigned(wire174) <<< (~^(8'hba))) <<< $signed((reg184 ?
                      reg198 : (8'ha2))))));
            end
        end
      reg201 <= (($signed(($unsigned(reg186) && $unsigned(reg185))) >> $signed((~|(reg194 <<< reg198)))) ?
          $signed((&($unsigned(reg185) ?
              wire177 : ((8'hb1) - reg196)))) : ((8'hb4) ^ ({$signed(reg189),
              reg196[(2'h3):(2'h3)]} + ((wire181 + wire180) ?
              (~(8'h9d)) : (reg199 & reg185)))));
    end
  assign wire202 = ((&$unsigned(reg196)) ?
                       reg188 : $unsigned($unsigned(wire179)));
  assign wire203 = (!reg184);
  assign wire204 = ({($unsigned((wire175 || wire203)) > $unsigned(reg187)),
                       (&reg196)} & (~&$signed($signed($unsigned(reg190)))));
  assign wire205 = (^~wire180[(3'h5):(2'h2)]);
  assign wire206 = wire205[(5'h13):(4'hd)];
  assign wire207 = $signed((($unsigned((reg183 ? wire178 : reg186)) ?
                           ($signed(wire175) >> reg199[(4'he):(4'h8)]) : reg186) ?
                       $signed($unsigned({reg198})) : {{(reg189 ?
                                   (8'ha7) : wire202),
                               (wire175 << (8'hac))}}));
  assign wire208 = (&{((|(reg187 ? reg185 : wire177)) ?
                           (((8'had) ^ wire176) < (|wire180)) : {((8'hbf) == reg197),
                               (wire207 ? reg200 : reg182)}),
                       {wire202[(2'h2):(1'h1)], reg184}});
  assign wire209 = $signed((($signed((wire205 ~^ wire204)) ~^ $unsigned((reg185 > reg196))) ?
                       $unsigned(((~&(8'h9f)) ?
                           (wire203 ?
                               wire207 : reg186) : reg183[(3'h4):(1'h1)])) : reg201[(4'h8):(2'h2)]));
  assign wire210 = $signed((!$unsigned((!((8'hb3) << wire174)))));
  assign wire211 = reg184[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg212 <= reg184;
      reg213 <= $signed((reg194[(4'ha):(1'h0)] <= $unsigned((reg189[(3'h6):(3'h6)] ?
          wire177 : $signed(reg199)))));
      if ($signed((~^reg192)))
        begin
          reg214 <= (!((~^reg200[(1'h1):(1'h1)]) >= {(~reg189), (8'hb1)}));
          reg215 <= $unsigned(((reg185 ? (~^reg201) : $signed(wire175)) ?
              reg189[(4'h9):(3'h7)] : wire210));
          reg216 <= reg215[(4'h8):(3'h7)];
          if (reg190[(4'h9):(4'h9)])
            begin
              reg217 <= (&wire208[(4'hd):(1'h0)]);
              reg218 <= $unsigned($signed({wire176[(2'h2):(1'h0)]}));
            end
          else
            begin
              reg217 <= ((^~((wire204[(2'h3):(1'h1)] ?
                      reg198 : $signed(wire204)) ?
                  $signed(reg216) : (reg188[(4'h9):(2'h2)] == {reg188}))) ^ $unsigned((($signed((7'h44)) ?
                      (wire209 > reg194) : wire175[(4'hd):(4'h8)]) ?
                  {$unsigned(reg186)} : reg200[(5'h11):(1'h1)])));
              reg218 <= ((&(($unsigned(reg184) >>> $unsigned(wire175)) >= (~reg215[(5'h11):(4'hf)]))) ?
                  (^~$signed(reg213[(3'h5):(3'h5)])) : $unsigned($signed(((|wire206) ?
                      reg194[(3'h6):(2'h2)] : $unsigned(reg182)))));
              reg219 <= reg201[(3'h4):(2'h3)];
              reg220 <= ({wire181,
                  ($unsigned($signed(reg189)) >= (((7'h41) ? reg183 : reg187) ?
                      wire211[(4'h8):(3'h4)] : $unsigned(reg185)))} <<< (-$unsigned((reg189 ?
                  (~&(8'hab)) : reg183[(2'h3):(1'h0)]))));
            end
        end
      else
        begin
          if (($signed((8'hbf)) ?
              (reg197 <= ((^{reg189,
                  wire211}) >> wire180[(4'hb):(3'h6)])) : (((^~(8'ha8)) >= (|(wire180 != wire176))) ?
                  (~|((wire202 + reg212) > {(8'h9c)})) : reg214[(3'h5):(1'h1)])))
            begin
              reg214 <= reg190;
              reg215 <= (8'hac);
              reg216 <= wire181;
              reg217 <= wire204[(4'ha):(3'h6)];
            end
          else
            begin
              reg214 <= {(!reg199)};
              reg215 <= reg219[(2'h2):(1'h1)];
              reg216 <= (wire208 && reg199);
              reg217 <= reg215;
            end
          reg218 <= {wire177};
          reg219 <= (+$unsigned((($unsigned(reg220) >= (wire180 ?
              reg219 : reg216)) ^ (8'ha7))));
          reg220 <= $signed((reg216 ?
              ($signed((reg186 ~^ (8'hb4))) ~^ (+(|reg192))) : (|(((8'hb8) ?
                  reg195 : reg193) >> (reg216 ? reg184 : reg183)))));
        end
      if (({(wire208[(4'ha):(4'h8)] ^ (reg219[(5'h10):(3'h4)] > (&reg220))),
              $unsigned(reg220)} ?
          reg214[(4'he):(3'h5)] : reg188))
        begin
          reg221 <= reg197[(3'h4):(3'h4)];
          reg222 <= wire204;
          reg223 <= ({(+$unsigned(wire205)),
              $signed(wire176[(1'h1):(1'h0)])} - {($signed(reg214) << wire209)});
          reg224 <= $signed((~^({(reg213 & (8'hbb)), (8'ha8)} ?
              {wire176[(2'h2):(2'h2)]} : reg190[(2'h2):(1'h1)])));
          reg225 <= $unsigned(reg221);
        end
      else
        begin
          reg221 <= ({({wire208[(4'he):(2'h3)]} > reg215[(4'h9):(2'h3)])} == reg213[(3'h7):(2'h3)]);
          if ((wire211 ?
              {$unsigned($unsigned(wire202[(2'h3):(1'h0)])),
                  $signed(($unsigned(reg218) != reg186[(3'h4):(2'h2)]))} : ({(reg195 ?
                      (8'had) : $unsigned((8'ha7))),
                  reg220[(2'h3):(2'h2)]} - reg201[(4'hd):(3'h5)])))
            begin
              reg222 <= ($unsigned(wire181[(4'hb):(3'h4)]) >>> $unsigned(($signed(reg225) & (~$signed(reg217)))));
              reg223 <= (((^~$signed($signed(reg201))) ?
                  {(wire211[(3'h5):(1'h0)] ?
                          (reg193 ? (8'ha7) : reg224) : (-wire203)),
                      ((8'h9c) ?
                          (wire207 ?
                              reg188 : reg220) : (wire180 < reg196))} : wire176) == $signed($signed($signed(reg199[(3'h5):(2'h3)]))));
              reg224 <= $unsigned(wire205);
              reg225 <= (+$unsigned({{reg214[(4'hb):(4'h8)],
                      $unsigned((8'hb7))},
                  ($signed(reg215) ? wire211[(3'h6):(2'h2)] : (!(8'h9f)))}));
            end
          else
            begin
              reg222 <= reg201[(5'h12):(3'h5)];
            end
        end
    end
  assign wire226 = reg185[(1'h0):(1'h0)];
  assign wire227 = (~|$signed({reg214, reg195}));
  assign wire228 = $unsigned($signed((&wire207)));
  assign wire229 = ((+reg224) ?
                       $unsigned($unsigned({$signed(wire177),
                           reg189[(4'hb):(2'h3)]})) : ((wire226[(1'h0):(1'h0)] ?
                           $signed($signed(reg200)) : reg185[(3'h5):(1'h1)]) ~^ $unsigned(reg196[(1'h0):(1'h0)])));
  assign wire230 = (!$unsigned(reg222[(2'h2):(2'h2)]));
endmodule

module module99  (y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire103;
  input wire [(5'h10):(1'h0)] wire102;
  input wire [(2'h2):(1'h0)] wire101;
  input wire signed [(4'hb):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire148;
  wire signed [(2'h3):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire145;
  wire [(4'hd):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire143;
  wire [(4'he):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire138;
  wire signed [(3'h4):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire signed [(4'hd):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
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
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire104 = (^~{((~^{(8'hab), wire102}) ?
                           $unsigned(wire102[(3'h5):(1'h1)]) : {wire100[(2'h3):(2'h3)],
                               ((8'hb8) ? wire103 : wire102)})});
  assign wire105 = wire103[(2'h2):(1'h1)];
  assign wire106 = (((wire103[(1'h0):(1'h0)] ?
                           {{wire101}} : (+$signed(wire105))) ?
                       {(~|wire104)} : ((wire101[(2'h2):(1'h1)] ?
                               (|wire101) : wire100) ?
                           {((8'h9e) ?
                                   wire100 : wire105)} : ((wire104 ^ wire105) ~^ wire104[(2'h3):(1'h0)]))) ~^ ($unsigned(wire104[(2'h2):(2'h2)]) ?
                       $signed(((wire104 ? wire102 : wire101) ?
                           (wire105 > wire100) : (wire104 ^~ wire100))) : (((~(8'hbc)) <= {(7'h41),
                           wire104}) >>> {(!wire105),
                           ((8'h9e) ? wire102 : wire105)})));
  assign wire107 = (~&(~&wire102[(4'he):(2'h2)]));
  always
    @(posedge clk) begin
      reg108 <= ($unsigned((+wire104[(1'h0):(1'h0)])) ?
          wire100[(4'ha):(1'h1)] : wire105[(4'hb):(3'h5)]);
      reg109 <= (wire104 ?
          $unsigned(wire106[(1'h1):(1'h1)]) : {(|$signed($signed((8'haa)))),
              $signed($signed((wire101 * (8'ha9))))});
      reg110 <= (^{wire102});
      if ({wire103})
        begin
          if ((wire102 * ((reg109[(1'h0):(1'h0)] ?
                  (|(reg109 && wire104)) : ((wire102 ? wire107 : reg110) ?
                      $unsigned(wire104) : (|wire107))) ?
              (+reg108[(4'hc):(3'h7)]) : (((wire105 <= wire104) * (~reg110)) * $unsigned({wire106})))))
            begin
              reg111 <= wire105;
            end
          else
            begin
              reg111 <= wire106[(2'h3):(1'h0)];
            end
          reg112 <= $signed(({$unsigned((^wire100))} >>> (wire101[(2'h2):(1'h0)] < reg111)));
          if ($signed(reg111))
            begin
              reg113 <= ($signed((-reg112[(1'h0):(1'h0)])) - reg108);
              reg114 <= wire107;
              reg115 <= (($signed(($unsigned((8'haa)) ~^ wire107[(4'h9):(3'h4)])) >>> $unsigned(($unsigned((8'hb7)) <<< $unsigned(wire107)))) < ($unsigned({$unsigned(reg112),
                  $signed(wire101)}) >>> $unsigned(wire104)));
              reg116 <= $unsigned(wire107[(4'hd):(4'hc)]);
            end
          else
            begin
              reg113 <= reg116[(1'h0):(1'h0)];
              reg114 <= $unsigned($signed(((reg113[(2'h2):(1'h1)] ?
                      reg114 : $unsigned((8'h9d))) ?
                  (|(reg112 <<< (8'hbc))) : {(reg111 ? reg112 : wire101),
                      wire105[(4'ha):(3'h6)]})));
              reg115 <= wire103[(2'h2):(1'h0)];
              reg116 <= $unsigned(((((~^wire103) - wire107[(4'hd):(4'hb)]) | ($unsigned(wire101) ?
                  $signed(reg110) : $signed((8'h9d)))) ^ $unsigned($unsigned($unsigned(wire101)))));
              reg117 <= (reg110 ^~ ((($unsigned(reg111) >= reg114) >>> reg112) ?
                  reg116 : ({wire103[(2'h2):(1'h0)],
                      {reg112}} < (&(!wire106)))));
            end
          reg118 <= $signed({$unsigned($unsigned((wire103 ?
                  (8'hac) : (8'ha3))))});
        end
      else
        begin
          if ((~(({(+wire106), $signed(wire105)} ? reg117 : reg117) ?
              wire100 : $signed({reg114[(3'h5):(3'h5)], $signed(wire100)}))))
            begin
              reg111 <= $signed($unsigned(wire107));
              reg112 <= $signed(wire107);
            end
          else
            begin
              reg111 <= {$unsigned($unsigned(($unsigned((8'ha1)) ^~ $signed(wire106)))),
                  $unsigned((!wire103))};
              reg112 <= $unsigned(reg115);
              reg113 <= ((~&($signed($unsigned((8'ha5))) ?
                  wire102[(4'he):(4'h8)] : ((reg115 ? (8'ha3) : (8'hb1)) ?
                      $signed(reg109) : $unsigned(reg113)))) != (wire102 == reg114[(3'h6):(3'h4)]));
              reg114 <= ((((8'had) ?
                      $signed($unsigned(reg114)) : reg115) >>> $unsigned(reg115[(1'h0):(1'h0)])) ?
                  reg109[(3'h7):(3'h5)] : ((|({wire104} & (wire102 ?
                      wire104 : wire106))) <<< $signed($unsigned((~^reg113)))));
            end
          if ($unsigned(($unsigned(reg108[(3'h6):(3'h6)]) <= {((wire101 ?
                  reg118 : (8'hac)) != reg111)})))
            begin
              reg115 <= reg113[(1'h0):(1'h0)];
              reg116 <= (((reg114 ~^ wire104[(1'h1):(1'h1)]) ?
                      (((&reg110) & {wire102}) ?
                          $signed(reg116) : {$unsigned(wire103)}) : ($unsigned((8'hba)) ?
                          reg114[(3'h6):(2'h3)] : $signed($unsigned((8'ha0))))) ?
                  {$unsigned((+((8'hb0) ? wire102 : reg109))),
                      (!(&reg108))} : ($unsigned($unsigned((reg116 ?
                          (8'ha1) : reg114))) ?
                      wire101[(1'h0):(1'h0)] : $signed($unsigned($signed(reg117)))));
              reg117 <= ((reg109[(3'h6):(3'h4)] ?
                  $unsigned(reg109) : (-$signed((&reg114)))) && (~&reg116));
            end
          else
            begin
              reg115 <= {(($unsigned((|reg110)) >= ((reg115 & reg109) ?
                      wire101 : $signed(reg114))) > $signed($unsigned($unsigned(reg115))))};
            end
          if (wire101)
            begin
              reg118 <= reg110[(1'h1):(1'h1)];
              reg119 <= $unsigned((^~reg117));
              reg120 <= reg116;
              reg121 <= $unsigned((~&(~&((~reg117) ?
                  (-reg113) : reg116[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg118 <= $signed(wire107[(2'h2):(2'h2)]);
              reg119 <= ((^({(|wire107)} ^~ ($signed(wire104) ?
                      reg118[(2'h3):(2'h2)] : (wire105 ? reg117 : wire105)))) ?
                  (wire105 ?
                      $signed(reg118[(4'he):(3'h4)]) : ((|(reg114 + (8'hba))) - reg119)) : $signed(reg112));
              reg120 <= $unsigned((|reg119[(4'ha):(3'h4)]));
              reg121 <= $signed($unsigned(reg113[(1'h0):(1'h0)]));
            end
        end
      if ({$signed((8'ha1))})
        begin
          reg122 <= reg111[(3'h7):(2'h3)];
        end
      else
        begin
          reg122 <= (-$unsigned(reg109));
          if ((7'h43))
            begin
              reg123 <= (&((&(~^(wire102 >> (8'hba)))) <= reg118));
              reg124 <= (reg116[(2'h2):(2'h2)] ?
                  $unsigned((((+reg119) ? (reg111 ^~ reg122) : (~|reg115)) ?
                      $signed($unsigned(wire101)) : $signed($signed(wire102)))) : (((^~$unsigned(wire106)) ^ wire105) ?
                      (7'h43) : $unsigned(((reg114 ?
                          reg122 : wire100) < reg118[(4'he):(3'h4)]))));
              reg125 <= $unsigned(wire107);
              reg126 <= {{$unsigned($signed((8'h9f)))}};
              reg127 <= $signed(reg124[(4'ha):(2'h3)]);
            end
          else
            begin
              reg123 <= wire107;
              reg124 <= reg116[(1'h0):(1'h0)];
              reg125 <= {$unsigned(reg108), reg110[(2'h3):(2'h2)]};
              reg126 <= $unsigned(reg110);
              reg127 <= $signed(reg118[(4'hf):(3'h5)]);
            end
          if (((reg108[(3'h5):(1'h0)] ?
              wire106[(1'h0):(1'h0)] : (((+reg109) < (~&reg121)) + (~|(wire103 || reg121)))) != (|(8'ha3))))
            begin
              reg128 <= reg110;
              reg129 <= $signed(reg123);
              reg130 <= $unsigned(((+($signed(reg127) && $signed(reg110))) && (reg125[(1'h1):(1'h0)] | $unsigned(reg109[(2'h3):(2'h3)]))));
              reg131 <= $signed(wire107[(4'h8):(3'h7)]);
            end
          else
            begin
              reg128 <= ($unsigned(reg114[(3'h7):(3'h5)]) == $signed($unsigned(reg122)));
              reg129 <= ((((reg121 ? {wire105, (7'h43)} : wire101) ?
                      $signed(wire100) : ($signed((8'ha6)) ?
                          (wire103 & reg108) : wire106[(1'h0):(1'h0)])) || reg122) ?
                  {((~|(wire103 ? reg117 : reg127)) ?
                          $unsigned($unsigned(reg127)) : $signed(reg109[(2'h3):(1'h0)]))} : ((reg110 && ((reg128 ?
                          reg117 : reg122) > $unsigned(reg108))) ?
                      $signed((reg110[(2'h2):(1'h1)] ?
                          $unsigned(reg126) : (8'hb9))) : $unsigned(reg118[(4'h8):(1'h1)])));
              reg130 <= reg119;
              reg131 <= reg131[(2'h2):(1'h1)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg132 <= ((reg119 ? $unsigned($signed((-reg125))) : reg125) ?
          ($unsigned(((reg110 > reg131) ?
              reg122[(1'h0):(1'h0)] : {reg117})) < reg121) : (~|reg120[(4'ha):(2'h3)]));
      reg133 <= $unsigned(reg108);
      reg134 <= $unsigned($unsigned({$unsigned((wire102 && (8'hb4)))}));
    end
  assign wire135 = reg109[(3'h6):(1'h0)];
  assign wire136 = $unsigned((^{(+wire105),
                       {(wire105 - (8'h9f)), wire101[(1'h1):(1'h1)]}}));
  assign wire137 = (&(($signed($unsigned((8'ha4))) & (~&{reg128})) >>> (8'h9e)));
  assign wire138 = $unsigned((~$unsigned($unsigned((reg118 ?
                       reg114 : reg120)))));
  assign wire139 = $unsigned($signed($unsigned($unsigned({reg129}))));
  assign wire140 = reg112[(3'h4):(1'h0)];
  assign wire141 = (|{$signed(reg119),
                       {reg134[(3'h5):(1'h1)],
                           $signed((reg109 ? (8'hb2) : (8'hb2)))}});
  assign wire142 = $signed(($signed((~|$unsigned((8'ha7)))) && $unsigned(reg129)));
  assign wire143 = ($signed((((wire138 <<< reg120) ?
                           $signed(reg134) : {(8'hb8), reg115}) ~^ reg118)) ?
                       $unsigned(reg122) : (~|$unsigned($unsigned($signed(reg112)))));
  assign wire144 = $unsigned($unsigned(((8'hbf) ?
                       wire140[(1'h1):(1'h0)] : $unsigned({reg110}))));
  assign wire145 = ($signed((reg131 ? (&wire100) : (!(^wire136)))) ?
                       $signed((reg115 == (8'had))) : (!wire137));
  assign wire146 = $unsigned({($unsigned((8'had)) >> (wire138 * (+reg132))),
                       (8'hb0)});
  assign wire147 = {({$signed((|wire146))} ? reg119 : (~|(^~(|reg127)))),
                       (^~$unsigned((&wire138[(2'h3):(2'h2)])))};
  assign wire148 = wire143;
endmodule

module module67
#(parameter param95 = ({({(~^(8'hb2)), (~(8'hb7))} ? ((!(8'ha3)) ? ((8'hbc) < (8'ha5)) : ((8'hb5) ? (8'had) : (8'hae))) : (((8'ha0) ? (8'ha3) : (8'h9c)) >> {(8'hac), (7'h43)})), ((((8'h9c) >>> (8'hb3)) ? ((8'ha3) <<< (8'ha9)) : (&(8'haf))) ? {(8'hb4)} : ((!(8'hbe)) ? ((8'h9e) ? (8'h9f) : (7'h41)) : ((8'hba) & (8'hb3))))} >>> ((({(8'hb1)} ? ((8'ha0) ? (8'hab) : (8'hbc)) : {(8'hb6), (8'hae)}) || (~|{(8'hb7)})) <<< (-(~|((8'ha4) ? (8'hbc) : (8'ha4)))))), 
parameter param96 = param95)
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire72;
  input wire signed [(4'ha):(1'h0)] wire71;
  input wire [(4'h9):(1'h0)] wire70;
  input wire [(4'hd):(1'h0)] wire69;
  input wire signed [(3'h4):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire86;
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire86,
                 reg89,
                 reg88,
                 reg87,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg73 <= ($unsigned({(wire72 && wire70[(2'h3):(2'h3)]),
              $signed({wire69})}) ?
          (-(^wire70)) : $signed(((8'hae) || ((^wire69) == (wire71 >>> wire72)))));
      reg74 <= ($unsigned(reg73[(3'h5):(2'h3)]) ?
          ((($unsigned(reg73) ? $signed(wire70) : $unsigned(reg73)) ?
                  wire72 : $unsigned($signed(wire72))) ?
              wire69 : $signed(wire69[(3'h4):(3'h4)])) : {reg73[(1'h1):(1'h1)],
              $unsigned(reg73)});
      reg75 <= (wire70 ?
          (8'hb6) : $unsigned($signed({wire68, $unsigned(wire71)})));
      reg76 <= $unsigned(wire72);
      if (reg74[(4'h8):(4'h8)])
        begin
          reg77 <= $unsigned((reg73 ?
              {(+(wire69 ? reg76 : wire70))} : {wire71, (~^(+wire70))}));
          reg78 <= $signed((((^~wire72) <<< $signed(wire70)) >>> ((|(8'hb7)) ^~ (~^(wire69 ?
              reg73 : wire69)))));
          reg79 <= $unsigned((wire68 ?
              (~^($unsigned(wire70) * wire70[(3'h7):(1'h1)])) : (~(!wire69))));
          reg80 <= $unsigned($signed(reg78));
          if (reg76)
            begin
              reg81 <= ((reg76 <<< (reg79[(5'h13):(4'ha)] ^~ ({reg77} & {reg79}))) == $signed(reg78[(2'h2):(2'h2)]));
              reg82 <= $signed((&wire68[(1'h0):(1'h0)]));
              reg83 <= (~^$signed((((-reg78) <= wire72[(3'h6):(1'h1)]) ?
                  (reg76[(4'h8):(4'h8)] ?
                      wire69[(4'hd):(4'hc)] : reg79) : wire68[(3'h4):(2'h3)])));
              reg84 <= {(8'haf)};
              reg85 <= $unsigned({$signed(reg84[(1'h0):(1'h0)])});
            end
          else
            begin
              reg81 <= $signed($signed(reg83[(3'h4):(3'h4)]));
              reg82 <= (((+wire71[(3'h4):(1'h0)]) >> reg74) ?
                  reg76[(3'h7):(3'h7)] : (^$signed(wire72)));
              reg83 <= $signed(($unsigned((7'h41)) ^ (+$unsigned((reg82 ?
                  reg77 : (8'hb7))))));
              reg84 <= wire71;
              reg85 <= $unsigned(reg79);
            end
        end
      else
        begin
          reg77 <= reg81;
          if ((wire72 ~^ wire71[(2'h2):(1'h1)]))
            begin
              reg78 <= {(wire68 ?
                      $unsigned({(reg82 ?
                              reg83 : (8'hb0))}) : (wire72[(1'h1):(1'h1)] ?
                          $unsigned((~|wire69)) : reg80)),
                  $unsigned((!({wire68, reg79} + $unsigned(wire70))))};
            end
          else
            begin
              reg78 <= ((+(+reg81)) ?
                  $signed($signed(wire72)) : (($unsigned($unsigned(reg81)) || $signed((reg84 ?
                          (8'hbc) : reg79))) ?
                      (|$unsigned((wire69 ?
                          reg85 : reg81))) : (+(reg80[(4'he):(4'ha)] ?
                          (reg81 ? reg76 : reg85) : reg80))));
              reg79 <= {wire71};
              reg80 <= (^reg85[(4'hf):(4'hb)]);
              reg81 <= (~&(($signed(reg84) && ((^~(8'hb0)) & reg84)) != wire72));
            end
        end
    end
  assign wire86 = reg85[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg87 <= $unsigned(reg77);
      reg88 <= ({wire71} | reg87);
      reg89 <= (!(reg83[(3'h5):(3'h5)] ? wire86 : wire69[(3'h7):(1'h1)]));
    end
  assign wire90 = (^~(~wire70[(2'h2):(2'h2)]));
  assign wire91 = (((((wire86 >= reg88) ?
                          (reg82 ?
                              (8'ha6) : (8'hb3)) : (~^wire71)) != (~|$signed(wire68))) | ((~|reg79) * reg74)) ?
                      {(!$unsigned((^~reg88))), reg88} : ((wire86 && {(wire68 ?
                              reg85 : wire68),
                          {reg77, reg83}}) * $unsigned(reg82)));
  assign wire92 = (^$unsigned({$unsigned($signed(reg87))}));
  assign wire93 = {$signed($signed(($signed(reg75) ?
                          $unsigned(wire92) : $unsigned(reg85))))};
  assign wire94 = $signed({{$signed(reg89), $signed($unsigned(wire72))},
                      (((wire69 ?
                          reg82 : wire70) + (~^wire93)) << $signed((reg83 ?
                          reg88 : reg84)))});
endmodule
