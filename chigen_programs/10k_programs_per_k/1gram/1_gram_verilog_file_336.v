// Seed: 1650634437
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_0  = 32'd28,
    parameter id_15 = 32'd88,
    parameter id_29 = 32'd69,
    parameter id_37 = 32'd17
) (
    input tri _id_0,
    input wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    output tri0 id_4,
    output tri0 id_5,
    output tri id_6,
    input supply1 id_7,
    input uwire id_8,
    input wor id_9,
    output logic id_10,
    input tri1 id_11,
    input tri0 id_12,
    input wire id_13,
    output tri0 id_14,
    input tri0 _id_15,
    input wand id_16,
    input tri1 id_17,
    input tri0 id_18,
    output wor id_19,
    input uwire id_20,
    input wand id_21,
    input tri1 id_22,
    output wire id_23,
    output supply0 id_24,
    input tri0 id_25,
    input supply1 id_26,
    output uwire id_27,
    input tri1 id_28,
    input supply1 _id_29,
    input tri1 id_30,
    input supply0 id_31,
    input supply1 id_32,
    inout supply0 id_33,
    input supply0 id_34,
    input uwire id_35
);
  wire _id_37, id_38;
  logic [7:0] id_39, id_40[id_37 : id_15];
  nor primCall (
      id_33,
      id_16,
      id_20,
      id_42,
      id_18,
      id_21,
      id_30,
      id_9,
      id_34,
      id_43,
      id_7,
      id_8,
      id_13,
      id_1,
      id_22,
      id_26,
      id_3,
      id_39,
      id_41,
      id_2,
      id_31,
      id_12,
      id_11,
      id_25,
      id_40,
      id_38,
      id_17,
      id_28
  );
  wire id_41;
  wire id_42;
  wire [id_0 : 1  &&  id_29] id_43;
  module_0 modCall_1 (
      id_41,
      id_38,
      id_38,
      id_42,
      id_42
  );
  logic id_44;
  always id_10 <= id_40['b0] ==? id_11;
endmodule
