// Seed: 773797839
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input tri1 id_7,
    input wire module_0,
    input tri id_9,
    input tri1 id_10,
    output tri id_11,
    output supply1 id_12,
    output tri id_13,
    input uwire id_14,
    input uwire id_15,
    output tri0 id_16,
    input wand id_17
);
  assign module_1.id_4 = 0;
  always @(posedge id_8 or -1'b0) begin : LABEL_0
    force id_5 = id_9;
  end
  wire id_19 = id_10;
endmodule
module module_1 #(
    parameter id_1 = 32'd46,
    parameter id_5 = 32'd51
) (
    output supply1 id_0,
    input uwire _id_1,
    input tri id_2,
    input supply1 id_3,
    input tri id_4,
    input supply0 _id_5,
    input uwire id_6,
    input wand id_7,
    input tri0 id_8,
    output tri0 id_9,
    output supply0 id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_4,
      id_9,
      id_4,
      id_0,
      id_7,
      id_4,
      id_8,
      id_2,
      id_8,
      id_0,
      id_9,
      id_10,
      id_4,
      id_3,
      id_0,
      id_2
  );
  wire [id_5 : id_1] id_13;
endmodule
