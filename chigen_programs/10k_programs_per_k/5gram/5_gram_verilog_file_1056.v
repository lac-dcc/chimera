// Seed: 1211291697
module module_0 (
    input uwire id_0,
    input tri id_1,
    output tri1 id_2,
    input wor id_3,
    output supply1 id_4
);
  logic id_6;
  ;
  bit id_7;
  assign module_1.id_6 = 0;
  wire id_8;
  ;
  wire id_9;
  always @(negedge -1'b0 or posedge id_1) id_7 = 1;
  logic id_10 = id_7;
  supply1 id_11 = 1'b0;
  wire id_12;
endmodule
module module_1 #(
    parameter id_2 = 32'd36,
    parameter id_4 = 32'd11
) (
    input uwire id_0,
    output supply0 id_1,
    inout uwire _id_2,
    input tri id_3,
    input uwire _id_4,
    input tri id_5,
    input wor id_6,
    output wor id_7,
    input uwire id_8
);
  assign id_7 = id_0;
  logic id_10;
  assign id_10[id_2==?id_4] = 1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_7,
      id_0,
      id_7
  );
  wire id_11;
endmodule
