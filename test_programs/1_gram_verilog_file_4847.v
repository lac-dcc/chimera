// Seed: 872035418
module module_0 (
    id_1,
    id_2,
    id_3#(
        .id_4 (1'b0 & id_5),
        .id_6 (1),
        .id_7 (1 * id_8 == id_9),
        .id_10(~-1)
    ),
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always $display();
  wire id_22;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  wire id_5 = id_5;
  wire id_6 = id_4;
  wire id_7, id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_7,
      id_5,
      id_6,
      id_7,
      id_7,
      id_6,
      id_5,
      id_8,
      id_6,
      id_8
  );
  localparam id_9 = -1;
  id_10(
      id_2.id_8
  );
  wire id_11;
  or primCall (id_2, id_1, id_6, id_3, id_5);
endmodule
