// Seed: 2384354853
module module_0 #(
    parameter id_26 = 32'd73
) (
    input wire id_0,
    output tri id_1,
    output tri id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    output supply1 id_7,
    output supply0 id_8
    , id_24,
    output supply0 id_9,
    input wor id_10,
    input wire id_11,
    input supply1 id_12,
    input wor id_13,
    output uwire id_14,
    input tri0 id_15,
    input tri0 id_16,
    input tri0 id_17,
    input supply1 id_18,
    input supply0 id_19,
    output supply1 id_20,
    input tri0 id_21,
    input wire id_22
);
  assign id_14 = id_19 - id_4 >= id_10;
  parameter id_25 = 1;
  localparam id_26 = id_25[(id_26) : {-1'b0, 1}];
  wire id_27;
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    input  tri0  id_2,
    input  wor   id_3,
    output wand  id_4,
    input  tri0  id_5,
    input  wire  id_6
);
  always @(posedge id_0);
  wire id_8;
  always @(negedge 1 or posedge 1) id_1 <= id_2;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_0,
      id_6,
      id_6,
      id_5,
      id_4,
      id_4,
      id_4,
      id_0,
      id_5,
      id_5,
      id_3,
      id_4,
      id_2,
      id_0,
      id_3,
      id_3,
      id_6,
      id_4,
      id_3,
      id_0
  );
endmodule
