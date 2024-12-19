// Seed: 1373302861
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wire id_4,
    output supply1 id_5,
    input uwire id_6,
    output uwire id_7,
    input wand id_8,
    input tri1 id_9,
    input tri0 id_10,
    output supply0 id_11,
    output tri0 id_12,
    input tri id_13,
    input supply0 id_14,
    output tri id_15,
    input wand id_16,
    input tri1 id_17
);
  generate
    reg id_19, id_20, id_21;
    begin : LABEL_0
      begin : LABEL_0
        wire id_22;
        wire id_23;
      end
    end
    assign id_3 = id_4;
  endgenerate
  wire id_24;
  initial id_21 <= 1'b0;
endmodule
module module_1 (
    input logic id_0,
    output tri id_1,
    input tri id_2,
    input wor id_3,
    output supply1 id_4,
    input tri id_5,
    input supply0 id_6,
    input wand id_7,
    input tri id_8,
    input wor id_9,
    output tri1 id_10,
    input tri1 id_11
    , id_19 = 1,
    input wor id_12,
    inout wand id_13,
    input wire id_14,
    inout wor id_15,
    output logic id_16,
    output supply0 id_17
);
  supply0 id_20;
  final
    if (1) id_16 <= id_0;
    else #1 if (id_9) id_20 = 1;
  id_21(
      1, 1'b0, 1
  );
  wire id_22, id_23;
  assign id_13 = id_13;
  module_0 modCall_1 (
      id_17,
      id_11,
      id_2,
      id_10,
      id_11,
      id_15,
      id_13,
      id_17,
      id_2,
      id_9,
      id_14,
      id_1,
      id_13,
      id_14,
      id_6,
      id_17,
      id_12,
      id_6
  );
  assign modCall_1.type_12 = 0;
endmodule
