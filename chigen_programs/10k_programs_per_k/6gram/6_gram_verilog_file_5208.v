// Seed: 2055914991
module module_0 (
    input  tri1 id_0,
    input  tri1 id_1,
    input  tri1 id_2,
    input  tri0 id_3,
    output tri0 id_4
);
  wire id_6;
  assign module_1._id_15 = 0;
  wire id_7;
  ;
endmodule
module module_1 #(
    parameter id_15 = 32'd53,
    parameter id_2  = 32'd35
) (
    input tri0 id_0,
    output uwire id_1,
    input wor _id_2,
    input wor id_3,
    input wor id_4,
    input uwire id_5,
    input tri0 id_6,
    input supply1 id_7,
    input wand id_8,
    input uwire id_9,
    output logic id_10,
    input tri1 id_11,
    input wire id_12,
    output tri0 id_13,
    output wire id_14,
    input uwire _id_15,
    input wor id_16,
    input wire id_17,
    input uwire id_18,
    output tri id_19
);
  wire [id_2 : id_15] id_21 = 1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_5,
      id_1
  );
  assign id_10 = -1;
  xor primCall (
      id_1, id_0, id_3, id_4, id_18, id_7, id_11, id_5, id_6, id_16, id_8, id_12, id_9, id_21, id_17
  );
  always @(posedge id_9 or posedge id_18) id_10 = "";
endmodule
