// Seed: 3781199628
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input tri1 id_2,
    input tri1 id_3
);
  supply1 id_5 = {1};
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output tri   id_3,
    input  uwire id_4,
    output logic id_5,
    input  wand  id_6
);
  assign id_3 = 1 ? 1 + 1 : {id_4, id_2};
  wand id_8 = id_1;
  supply1 id_9, id_10;
  wire id_11;
  wire id_12;
  id_13(
      .id_0(1 + 1), .id_1(1), .id_2(1), .id_3(id_3), .id_4(1'h0)
  );
  wire id_14;
  tri  id_15 = 1;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_6,
      id_2
  );
  assign modCall_1.id_0 = 0;
  always @(id_10 == 1 or posedge 1) begin : LABEL_0
    id_5 <= 1 !=? 1'b0;
    $display(id_1);
  end
endmodule
