// Seed: 795472316
macromodule module_0 #(
    parameter id_10 = 32'd6,
    parameter id_11 = 32'd83
) (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    inout tri0 id_3,
    input tri id_4,
    output uwire id_5
);
  wire id_7, id_8;
  wire id_9;
  defparam id_10.id_11 = 1;
  initial assert (1'd0);
  wire id_12;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input wand id_2,
    input tri id_3,
    output tri1 id_4,
    output wor id_5,
    input tri id_6
);
  for (id_8 = 1'b0; 1; id_5 = 1) begin : LABEL_0
    always @(id_0) id_1 = 1;
    wire id_9;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_8,
      id_3,
      id_5
  );
endmodule
