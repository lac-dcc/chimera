// Seed: 4243249985
module module_0 (
    input uwire id_0,
    output logic id_1,
    input supply1 id_2,
    output supply1 id_3,
    input wor id_4,
    input tri0 id_5,
    output wor id_6,
    input wand id_7,
    input supply0 id_8
);
  always id_1 <= -1;
  assign id_3 = 1;
  assign module_1.id_24 = 0;
  logic [7:0] id_10;
  assign id_1 = id_5;
  assign id_10[-1 :-1] = 1'b0;
endmodule
module module_1 #(
    parameter id_12 = 32'd51,
    parameter id_13 = 32'd15,
    parameter id_15 = 32'd9
) (
    output logic id_0,
    input wor id_1,
    input tri1 id_2,
    input wor id_3,
    input supply0 id_4,
    input tri id_5,
    output wire id_6,
    input wand id_7,
    input uwire id_8,
    input wand id_9,
    output uwire id_10,
    input uwire id_11,
    input tri1 _id_12,
    input wire _id_13,
    input uwire id_14,
    input wire _id_15[id_15 : -1],
    output supply1 id_16,
    input tri id_17[id_13 : id_12],
    input wand id_18,
    output supply0 id_19,
    output wire id_20,
    output tri id_21,
    output wor id_22,
    output wire id_23,
    input wand id_24,
    output wire id_25[-1 : -1]
    , id_27
);
  always begin : LABEL_0
    id_0 <= id_4;
  end
  logic id_28 = id_18;
  wire id_29, id_30;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_17,
      id_25,
      id_3,
      id_4,
      id_19,
      id_17,
      id_18
  );
  logic id_31 = id_14;
endmodule
