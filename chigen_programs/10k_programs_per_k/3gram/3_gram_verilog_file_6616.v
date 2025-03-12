// Seed: 834167170
module module_0 (
    output wand id_0,
    input supply0 id_1,
    output wor id_2,
    output tri1 id_3
);
endmodule
module module_1 #(
    parameter id_1 = 32'd34,
    parameter id_9 = 32'd39
) (
    input uwire id_0,
    input uwire _id_1,
    input uwire id_2,
    input wor id_3,
    output wire id_4,
    output logic id_5,
    output tri0 id_6,
    output tri0 id_7,
    input supply0 id_8,
    output supply0 _id_9,
    output supply0 id_10,
    input wor id_11,
    output tri id_12,
    input supply0 id_13
);
  assign id_12 = id_0;
  integer [id_9 : id_1] id_15;
  parameter id_16 = -1;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_7,
      id_11,
      id_4,
      id_6
  );
  assign modCall_1.id_2 = 0;
  assign id_6 = id_1;
  always @(negedge id_13 or posedge ~id_15) begin : LABEL_0
    id_5 <= !id_3;
    $clog2(51);
    ;
  end
endmodule
