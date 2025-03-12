// Seed: 2779431121
module module_0 (
    input tri  id_0,
    input wor  id_1,
    input tri1 id_2
);
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    inout supply0 id_3,
    input wor id_4,
    output wire id_5,
    output wand id_6,
    output tri id_7
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4
  );
  assign id_5 = -1;
endmodule
module module_2 #(
    parameter id_9 = 32'd81
) (
    output supply0 id_0,
    input supply0 id_1,
    output wor id_2,
    output uwire id_3,
    output wor id_4,
    input tri0 id_5,
    input wire id_6,
    input supply0 id_7,
    input wor id_8,
    input supply1 _id_9#(
        .id_14(1),
        .id_15(1),
        .id_16(1),
        .id_17(1),
        .id_18(1 - 1),
        .id_19("")
    ),
    input wor id_10,
    output logic id_11,
    output supply1 id_12
);
  always @* if ("") id_11 = id_19 != -1;
  assign id_19 = 1;
  wire [-1 'b0 : -1] id_20 = id_10;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5
  );
  wire id_21 = id_17;
  wire [id_9 : 1] id_22 = id_5;
endmodule
