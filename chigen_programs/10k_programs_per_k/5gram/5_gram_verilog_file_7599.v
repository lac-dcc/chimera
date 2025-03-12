// Seed: 3556161755
module module_0 (
    output supply1 id_0,
    input supply1 id_1
    , id_14,
    output wire id_2,
    input tri1 id_3,
    output supply1 id_4,
    output wor id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wand id_8,
    input supply1 id_9,
    input tri id_10,
    output supply1 id_11,
    input uwire id_12
);
endmodule
module module_1 #(
    parameter id_2 = 32'd99,
    parameter id_5 = 32'd51
) (
    input supply1 id_0,
    output logic id_1,
    input tri1 _id_2,
    output supply0 id_3,
    output logic id_4,
    input uwire _id_5
);
  always @(posedge -1 < id_5 + id_0 or posedge -1) begin : LABEL_0
    id_4 <= id_2;
    id_4 <= -1;
    if (-1'b0) id_1 <= id_5;
    else id_4 <= id_2;
    deassign id_1;
  end
  logic [(  id_2  ) : id_5] id_7;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.id_9 = 0;
endmodule
