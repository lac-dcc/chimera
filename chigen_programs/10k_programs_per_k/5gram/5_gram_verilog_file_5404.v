// Seed: 1980397368
module module_0 #(
    parameter id_8 = 32'd64,
    parameter id_9 = 32'd90
) (
    input tri id_0,
    output supply1 id_1,
    input supply1 id_2,
    output supply1 id_3,
    output tri id_4,
    input tri0 id_5
);
  assign id_3 = 1;
  assign id_3 = 1 - 1;
  wire id_7;
  defparam id_8.id_9 = 1'b0;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    input supply0 id_2,
    output tri id_3,
    output wand id_4,
    output uwire id_5,
    output logic id_6
);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_0,
      id_5,
      id_2
  );
  assign modCall_1.id_2 = 0;
  logic id_8;
  assign id_6 = id_8;
  initial begin : LABEL_0
    fork
      id_9;
      id_10(id_10 < id_9);
    join
    id_6 <= 1;
    @(posedge id_8);
    assign id_0 = 1'b0;
    @(posedge id_8);
  end
  always @(*) id_4 = 1'b0;
endmodule
