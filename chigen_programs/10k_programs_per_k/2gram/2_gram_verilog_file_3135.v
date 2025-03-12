// Seed: 2336887441
module module_0 (
    input tri id_0,
    input wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wire id_4,
    input supply1 id_5,
    input wand id_6,
    output tri1 id_7,
    input wire id_8,
    input supply0 id_9,
    input wor id_10,
    input supply0 id_11,
    output uwire id_12,
    output tri0 id_13,
    input wire id_14,
    input tri0 id_15,
    input uwire id_16,
    output tri id_17,
    output wire id_18,
    input supply0 id_19,
    input wand id_20,
    input uwire id_21
);
  wire [1 : -1] id_23, id_24;
  assign id_13 = 1'b0;
  parameter integer id_25 = 1;
  assign module_1.id_18 = 0;
endmodule
module module_1 #(
    parameter id_24 = 32'd46,
    parameter id_7  = 32'd28,
    parameter id_8  = 32'd20
) (
    output tri0 id_0,
    output uwire id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wire id_4,
    input supply0 id_5,
    output tri0 id_6#(
        .id_20(-1'b0),
        .id_21(-1'b0)
    ),
    input tri0 _id_7,
    output supply0 _id_8,
    output uwire id_9,
    input wire id_10,
    output tri id_11,
    output tri id_12,
    output uwire id_13,
    input supply1 id_14,
    output tri0 id_15,
    output wand id_16,
    input tri0 id_17,
    output tri0 id_18
);
  task id_22;
    input [id_7 : -1 'b0] id_23, _id_24, id_25, id_26, id_27;
  endtask
  assign id_18 = id_21;
  assign id_13 = id_25;
  logic [id_24 : id_8] id_28;
  ;
  logic id_29;
  wire  id_30;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_14,
      id_12,
      id_2,
      id_2,
      id_15,
      id_10,
      id_5,
      id_17,
      id_5,
      id_1,
      id_16,
      id_5,
      id_3,
      id_4,
      id_0,
      id_11,
      id_5,
      id_17,
      id_17
  );
  struct packed {
    id_31 id_32;
    logic [1 : 1] id_33;
  } id_34;
  logic id_35 = -1;
endmodule
