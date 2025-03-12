// Seed: 1592632448
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input tri id_2,
    output tri id_3,
    input wand id_4,
    input supply1 id_5,
    output wand id_6
);
  assign id_0 = -1;
endmodule
module module_1 #(
    parameter id_0  = 32'd96,
    parameter id_14 = 32'd81,
    parameter id_2  = 32'd5,
    parameter id_8  = 32'd25,
    parameter id_9  = 32'd84
) (
    output uwire _id_0,
    input tri0 id_1,
    output wor _id_2,
    output tri1 id_3,
    output wand id_4,
    input supply0 id_5,
    output tri0 id_6,
    output wire id_7,
    output wire _id_8,
    input wire _id_9,
    input wire id_10,
    output tri0 id_11
);
  localparam id_13 = 1, id_14 = 1, id_15 = id_1, id_16 = id_9;
  struct packed {
    logic [id_0 : id_8] id_17;
    struct packed {logic [1 : id_14] id_18;} [{  -1 'b0 {  1  }  } : id_9] id_19;
  } [-1 : id_2] id_20;
  parameter id_21 = id_13;
  wire id_22;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_7,
      id_1,
      id_5,
      id_4
  );
  assign modCall_1.id_2 = 0;
  assign id_20.id_17[-1'h0 : id_14] = id_13;
  assign id_7 = id_20.id_18;
endmodule
