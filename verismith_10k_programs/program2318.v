module top
#(parameter param34 = (((((|(8'ha0)) ^~ (~&(8'ha3))) ? ((+(8'ha4)) == {(8'ha7), (8'hab)}) : (8'ha0)) - {(~|((8'h9c) ~^ (8'ha5))), (+((8'hae) ? (8'h9f) : (8'hba)))}) ? (|(|(!(~^(7'h44))))) : {((((8'hb4) * (8'hab)) ? (8'ha3) : ((8'hb2) ? (7'h44) : (8'haf))) ? ({(8'hb1), (8'hba)} || ((8'hb4) < (8'hbc))) : {{(8'ha8)}}), ((^((8'hbb) ? (8'h9c) : (8'hb2))) ? (((7'h42) >= (8'ha7)) ? {(8'h9c), (8'ha8)} : ((8'h9f) ? (8'h9c) : (7'h44))) : ((|(8'hb7)) >= ((8'ha0) > (8'hb0))))}), 
parameter param35 = ({(param34 ? (^~(param34 ? param34 : param34)) : (param34 ? (param34 >>> (8'ha8)) : (&param34))), {({(7'h42)} ? (param34 > param34) : (~param34)), {{param34}}}} ? (~^(~&((~&(8'ha0)) >>> (param34 == param34)))) : (((param34 ? ((8'hb2) >= param34) : (param34 <<< param34)) ? (~^(param34 ? param34 : param34)) : (^param34)) | (-(^(param34 ? (8'hbe) : param34))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned($signed((~|((7'h43) * (8'hb9))))));
      reg7 <= wire3[(1'h1):(1'h1)];
    end
  assign wire8 = $signed(((($signed(reg6) ? (&wire3) : $unsigned(wire3)) ?
                         $unsigned($unsigned(wire0)) : $unsigned(wire3)) ?
                     $signed($unsigned((reg6 <= reg6))) : ($signed((~&wire2)) ?
                         ($unsigned(wire4) ?
                             $signed(wire0) : $unsigned(reg6)) : ($signed((8'hb1)) > (reg7 != (8'ha8))))));
  assign wire9 = $signed((({reg6} << (+$unsigned(reg6))) ?
                     (((|wire2) ? (wire5 ? wire8 : wire3) : (wire2 > reg6)) ?
                         {wire2[(1'h0):(1'h0)],
                             (~^wire2)} : wire8) : $signed(((wire4 ?
                         wire1 : wire4) * $unsigned(wire4)))));
  assign wire10 = reg7[(2'h3):(2'h3)];
  assign wire11 = (($unsigned($signed(wire5[(3'h7):(1'h0)])) ?
                          (~&{(7'h40),
                              $unsigned((8'h9c))}) : (-$signed(wire2))) ?
                      $signed($unsigned((&$unsigned(reg7)))) : wire0[(1'h1):(1'h0)]);
  assign wire12 = wire2[(2'h3):(1'h1)];
  assign wire13 = (^wire10);
  assign wire14 = ($signed((8'hb3)) ? wire2 : reg7[(1'h0):(1'h0)]);
  assign wire15 = wire14;
  assign wire16 = ($unsigned(wire14[(4'h9):(1'h1)]) ?
                      (($unsigned($unsigned(wire10)) ^~ ((~wire12) ?
                              wire2 : (wire13 ? wire5 : wire14))) ?
                          wire14 : (&wire15)) : wire13);
  always
    @(posedge clk) begin
      reg17 <= wire14;
      if ((wire16[(3'h5):(2'h2)] ? (^~(^$signed((8'hb1)))) : wire14))
        begin
          reg18 <= wire16[(4'hc):(2'h3)];
          reg19 <= wire16;
        end
      else
        begin
          reg18 <= ($unsigned($signed(((wire12 ^~ reg18) == (wire13 * wire15)))) < ({((wire1 ?
                      wire9 : wire3) ?
                  (~(8'h9f)) : (wire13 ? reg7 : (8'had))),
              $signed($unsigned(reg18))} >>> wire4[(2'h3):(2'h2)]));
          reg19 <= wire13;
          reg20 <= wire10[(2'h2):(2'h2)];
          if ($signed($unsigned(reg6)))
            begin
              reg21 <= (((wire3 ?
                          {((8'hbc) * wire9),
                              wire0[(2'h3):(1'h0)]} : wire3[(3'h6):(2'h3)]) ?
                      {wire3} : (!(7'h44))) ?
                  $unsigned(wire5[(3'h7):(3'h4)]) : $signed($signed($unsigned((reg6 ?
                      wire11 : wire10)))));
              reg22 <= wire9[(3'h4):(2'h3)];
              reg23 <= wire16[(3'h4):(2'h2)];
              reg24 <= $unsigned({($signed($signed(wire13)) ^ (~reg22)), reg7});
            end
          else
            begin
              reg21 <= $signed((~|wire15));
              reg22 <= (wire12[(4'hd):(3'h6)] ? reg17[(1'h0):(1'h0)] : reg6);
              reg23 <= $signed(((~^$unsigned($unsigned((8'ha3)))) >>> ((8'hb7) ?
                  wire1 : ((8'hb3) ? reg19 : $signed(wire12)))));
              reg24 <= $unsigned({((8'hbc) ?
                      $unsigned((~|wire4)) : wire1[(1'h1):(1'h1)]),
                  wire2});
            end
          if ({(reg24 ?
                  $signed(((8'hb8) ?
                      reg19[(3'h5):(3'h5)] : (wire10 * wire14))) : ((((7'h40) ?
                          reg21 : reg22) >> $unsigned(reg20)) ?
                      {(wire15 ^ wire16), (wire9 + reg18)} : reg6)),
              wire2})
            begin
              reg25 <= $signed($unsigned(wire3[(3'h4):(3'h4)]));
              reg26 <= (8'hae);
              reg27 <= reg24[(1'h0):(1'h0)];
              reg28 <= wire12[(2'h3):(1'h0)];
            end
          else
            begin
              reg25 <= reg26;
              reg26 <= reg19[(2'h3):(1'h0)];
            end
        end
    end
  assign wire29 = (^~$unsigned(({(reg27 ?
                          reg26 : reg6)} >>> ((wire3 && wire4) <= {wire0,
                      wire9}))));
  assign wire30 = (~$unsigned(wire12[(4'hc):(4'h9)]));
  assign wire31 = reg24;
  assign wire32 = $signed($unsigned(wire5[(3'h7):(3'h7)]));
  assign wire33 = wire8;
endmodule
