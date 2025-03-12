// Seed: 1472138039
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  assign module_1.id_19 = 0;
endmodule
module module_1 #(
    parameter id_21 = 32'd79
) (
    input supply1 id_0,
    output tri id_1,
    output supply1 id_2,
    input wor id_3[id_21 : {  1  ,  -1  }],
    input supply0 id_4,
    input tri id_5,
    input wire id_6,
    output tri id_7,
    input supply1 id_8,
    input tri id_9,
    input supply1 id_10,
    output logic id_11,
    input uwire id_12,
    input supply0 id_13,
    input tri0 id_14,
    input tri id_15,
    input uwire id_16,
    output uwire id_17,
    input supply1 id_18,
    input tri0 id_19,
    input supply1 id_20,
    input supply0 _id_21,
    output uwire id_22
    , id_25,
    output tri id_23
);
  union packed {logic id_26;} id_27;
  ;
  module_0 modCall_1 (
      id_26,
      id_25,
      id_27
  );
  assign id_2  = id_6;
  assign id_23 = -1;
  logic id_28;
  ;
  assign id_1 = -1;
  always id_11 <= #1 id_27.id_26[1];
  wire id_29, id_30;
endmodule
