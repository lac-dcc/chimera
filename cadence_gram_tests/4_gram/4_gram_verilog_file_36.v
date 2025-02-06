// Seed: 364678695
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_12(
      .id_0($realtime + (id_1[$realtime])), .id_1(id_10), .id_2()
  );
  wire id_13;
  wire id_14;
  id_15(
      .id_0()
  );
  assign id_9 = -1'b0 & $realtime;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_8 = $realtime ? id_17 : 1 == 1;
  supply0 id_19 = id_14 ? id_19 : (-1);
  module_0 modCall_1 (
      id_13,
      id_19,
      id_6,
      id_5,
      id_3,
      id_4,
      id_4,
      id_4,
      id_19,
      id_2,
      id_19
  );
  assign id_16[$realtime] = id_17;
  always @(id_3 or $realtime) begin : LABEL_0
    id_2 = 1;
    if (~id_4)
      if ((1))
        if (1)
          if (-1) begin : LABEL_0
            id_17 <= $realtime;
          end else begin : LABEL_0
            if (-1) id_11 <= 1'b0;
            else if ($realtime) if (id_19) id_7 <= -1;
          end
        else begin : LABEL_0
          if ($realtime) begin : LABEL_0
            id_8 <= 1;
          end else
            for (id_7 = id_13[$realtime]; $realtime; id_14++) begin : LABEL_0
              if ($realtime) id_17 <= -1;
              else id_11 <= $realtime;
            end
        end
      else if ($realtime) id_14 <= $realtime;
  end
  or primCall (id_9, id_19, id_4, id_17, id_14, id_3, id_5, id_13, id_11, id_6);
  wire id_20;
  wire id_21;
endmodule
