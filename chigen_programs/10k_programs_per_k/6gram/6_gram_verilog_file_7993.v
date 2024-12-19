// Seed: 4086786519
module module_0 #(
    parameter id_5 = 32'd71,
    parameter id_6 = 32'd61
) (
    output supply0 id_0,
    input tri1 id_1,
    input tri1 id_2,
    output tri1 id_3
);
  defparam id_5.id_6 = 1;
  assign module_1.type_13 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri0 id_5,
    output logic id_6,
    input wire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_2
  );
  initial begin : LABEL_0
    #1 id_9 = 1;
    repeat (id_7[1])
    if (1) id_6 <= 1;
    else id_6 = 1;
    $display(1);
  end
endmodule
