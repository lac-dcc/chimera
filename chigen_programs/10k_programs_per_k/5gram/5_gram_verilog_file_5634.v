// Seed: 1506182135
module module_0;
  wire [-1 : 1] id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd25
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  not primCall (id_1, id_3);
  wire _id_4;
  assign id_1 = id_4;
  module_0 modCall_1 ();
  assign id_1[-1==id_4-id_4] = id_3;
  wire id_5;
endmodule
module module_2 (
    input tri0 id_0,
    input wire id_1,
    input supply1 id_2,
    input wand id_3,
    input tri0 id_4,
    input wor id_5,
    output supply0 id_6,
    output supply1 id_7,
    input wire id_8,
    input tri1 id_9,
    input tri id_10,
    input wand id_11,
    output wor id_12,
    input tri1 id_13,
    input supply1 id_14,
    output uwire id_15,
    input wand id_16,
    output tri0 id_17,
    input supply0 id_18,
    input wor id_19,
    input tri id_20,
    input tri0 id_21
);
endmodule
module module_0 #(
    parameter id_12 = 32'd95,
    parameter id_4  = 32'd80
) (
    input wor id_0,
    input wand id_1,
    input tri0 module_3,
    input uwire id_3,
    input tri1 _id_4,
    output tri1 id_5,
    output wire id_6,
    output uwire id_7,
    input tri id_8,
    output supply1 id_9,
    input tri id_10,
    input wire id_11,
    input wire _id_12,
    input tri1 id_13,
    output logic id_14,
    output wire id_15,
    output logic id_16,
    input supply0 id_17,
    output wand id_18,
    input tri id_19,
    output supply1 id_20
);
  supply1 [id_4 : id_12] id_22 = 1;
  assign id_5 = id_2;
  always @(posedge id_22 != id_19 or posedge (1)) id_16 = 1 < id_10;
  parameter id_23 = 1;
  genvar id_24, id_25, id_26, id_27;
  module_2 modCall_1 (
      id_0,
      id_19,
      id_13,
      id_10,
      id_17,
      id_17,
      id_15,
      id_15,
      id_8,
      id_1,
      id_19,
      id_13,
      id_6,
      id_8,
      id_1,
      id_9,
      id_19,
      id_7,
      id_19,
      id_3,
      id_17,
      id_19
  );
  always @(-1'b0)
    if (id_23) id_14 <= -1;
    else $clog2(84);
  ;
endmodule
