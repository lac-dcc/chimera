// Seed: 1910582800
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    output wire id_2,
    input tri1 id_3,
    output tri1 id_4,
    input tri id_5,
    input wor id_6,
    output wor id_7,
    output wire id_8,
    input tri0 id_9,
    input tri id_10,
    output supply1 id_11,
    input uwire id_12,
    input wand id_13,
    output supply0 id_14,
    output wand id_15,
    input wire id_16,
    input tri0 id_17,
    input supply0 id_18,
    input wand id_19
);
  id_21(
      .id_0(id_2), .id_1(1'b0), .id_2(1)
  );
endmodule
module module_1 (
    output uwire id_0,
    input wand id_1,
    input wor id_2,
    output logic id_3,
    input logic id_4,
    input tri1 id_5,
    output wire id_6,
    output tri1 id_7,
    input supply0 id_8,
    output wire id_9,
    output wor id_10,
    input supply0 id_11,
    input tri id_12,
    output tri1 id_13,
    input supply1 id_14,
    output supply1 id_15,
    input uwire id_16,
    input supply0 id_17,
    input wire id_18,
    output wire id_19
);
  assign id_10 = 1;
  module_0 modCall_1 (
      id_15,
      id_1,
      id_6,
      id_11,
      id_6,
      id_2,
      id_18,
      id_9,
      id_15,
      id_16,
      id_14,
      id_0,
      id_1,
      id_18,
      id_19,
      id_0,
      id_2,
      id_12,
      id_5,
      id_14
  );
  assign modCall_1.type_2 = 0;
  logic id_21 = id_4;
  logic [7:0] id_22;
  assign id_22[1] = ~{id_5, id_22[1]};
  assign id_3 = id_21;
  tri id_23 = 1 == 1;
  task id_24;
    input id_25;
    id_3 <= id_24;
  endtask
  wire id_26;
endmodule
