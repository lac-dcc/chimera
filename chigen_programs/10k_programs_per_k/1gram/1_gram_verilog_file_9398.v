// Seed: 608368413
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input tri0 id_2,
    output wire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input tri id_6,
    output supply0 id_7,
    input tri id_8,
    input tri1 id_9,
    input tri1 id_10,
    input tri1 id_11,
    output wire id_12,
    input uwire id_13,
    input wor id_14,
    input uwire id_15
);
  localparam int id_17 = 1'h0;
  struct packed {
    id_18 id_19;
    struct packed {
      logic id_20  = -1'b0;
      logic id_21;
    } id_22;
    logic id_23;
    struct packed {
      logic id_24;
      logic id_25;
    } id_26;
  } id_27;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input uwire id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri id_5,
    input wire id_6,
    input tri0 id_7,
    input wire id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_1,
      id_5,
      id_6,
      id_1,
      id_7,
      id_8,
      id_7,
      id_2,
      id_3,
      id_2,
      id_8,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
