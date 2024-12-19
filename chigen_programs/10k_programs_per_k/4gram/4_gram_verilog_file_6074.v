// Seed: 3917332864
module module_0;
  reg id_1;
  reg id_2;
  reg id_3;
  always @(posedge 1'b0 or posedge id_2) id_2 <= 1;
  always_ff #(id_1 - 1)
    if (1) id_1 <= 1;
    else begin : LABEL_0
      id_3 <= 1;
    end
  wire id_4;
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    output tri1 id_6
);
  wire id_8;
  assign id_6 = id_3 - id_1 ? id_4 - 1 : 1 ? id_0 : id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  final $display(1, 1);
  id_9(
      .id_0(1), .id_1(id_8), .id_2(1'b0)
  );
endmodule
