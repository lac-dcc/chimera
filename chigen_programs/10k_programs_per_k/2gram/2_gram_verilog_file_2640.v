// Seed: 4289450445
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri0 id_2
);
  logic id_4[-1 : 1];
  ;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_1  = 32'd15,
    parameter id_12 = 32'd70,
    parameter id_9  = 32'd13
) (
    input uwire id_0,
    input uwire _id_1,
    input tri id_2,
    input tri id_3,
    output wire id_4,
    input supply1 id_5,
    input supply1 id_6,
    input supply0 id_7
);
  wire _id_9;
  generate
    supply0 id_10;
    logic [id_1 : 1] id_11;
    ;
    assign id_11 = id_10;
    wire [1 : ""] _id_12;
    assign id_10 = -1;
    logic id_13;
  endgenerate
  assign id_10 = id_5;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3
  );
  wire id_14;
  assign id_9 = id_13;
  integer id_15;
  always id_15[id_12+:id_9] <= id_13;
endmodule
