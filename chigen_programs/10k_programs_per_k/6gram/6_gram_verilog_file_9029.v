// Seed: 3291968454
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input wor id_2,
    input tri0 id_3,
    input wand id_4,
    input wire id_5,
    output wire id_6,
    input tri0 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri id_10,
    input tri0 id_11,
    input wor id_12,
    output supply0 id_13,
    output tri0 id_14,
    input tri0 id_15,
    input wand id_16,
    input uwire id_17,
    input tri1 id_18,
    input uwire id_19,
    output tri0 id_20
);
  tri1 id_22;
  assign id_22 = 1'b0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input supply0 id_2,
    output tri id_3,
    input logic id_4,
    input tri id_5,
    output uwire id_6,
    input wor id_7,
    input logic id_8,
    input wor id_9,
    input uwire id_10,
    output uwire id_11,
    output tri id_12,
    output logic id_13
);
  logic id_15;
  initial begin : LABEL_0
    id_13 = #(id_5 * id_9 - id_5) (id_4);
    if (1)
      case (1)
        id_8: id_13 <= #id_10  !id_8;
        !id_2 | (id_15): id_11 = 1 == id_9;
        id_4: id_15 = 1'b0;
        default: id_15 = id_8;
      endcase
  end
  module_0 modCall_1 (
      id_6,
      id_2,
      id_9,
      id_5,
      id_9,
      id_2,
      id_12,
      id_5,
      id_1,
      id_12,
      id_9,
      id_7,
      id_7,
      id_12,
      id_6,
      id_1,
      id_0,
      id_0,
      id_9,
      id_7,
      id_12
  );
  assign modCall_1.id_17 = 0;
endmodule
