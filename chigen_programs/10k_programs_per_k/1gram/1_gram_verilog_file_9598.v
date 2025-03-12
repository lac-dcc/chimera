// Seed: 2871960135
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output wor id_6,
    output tri id_7,
    input tri1 id_8,
    input tri id_9,
    input supply0 id_10,
    input tri0 id_11,
    input supply1 id_12
);
  assign id_7 = !id_1;
  localparam id_14 = 1;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_17 = 32'd73,
    parameter id_20 = 32'd64
) (
    output wor id_0,
    output supply1 id_1,
    output supply1 id_2,
    input supply1 id_3,
    input uwire id_4,
    input wire id_5,
    input supply0 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input supply0 id_9,
    output uwire id_10,
    input tri id_11[1 : 1  <->  id_17  |  -1],
    input tri1 id_12,
    input tri id_13,
    output tri0 id_14,
    input supply0 id_15,
    output tri1 id_16,
    input wire _id_17
);
  wire id_19, _id_20, id_21;
  wire [1 : id_20] id_22;
  xor primCall (
      id_10,
      id_3,
      id_19,
      id_22,
      id_21,
      id_4,
      id_9,
      id_13,
      id_15,
      id_8,
      id_11,
      id_6,
      id_7,
      id_5,
      id_12
  );
  module_0 modCall_1 (
      id_15,
      id_11,
      id_6,
      id_4,
      id_6,
      id_6,
      id_2,
      id_16,
      id_15,
      id_9,
      id_6,
      id_5,
      id_3
  );
endmodule
