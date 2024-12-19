// Seed: 3489268257
module module_0;
  wire id_1;
  wire id_2, id_3;
endmodule
module module_1 (
    output supply1 id_0,
    output supply1 id_1,
    input uwire id_2,
    input tri id_3,
    input tri1 id_4,
    output logic id_5,
    input supply1 id_6,
    input supply1 id_7,
    input wor id_8
);
  module_0 modCall_1 ();
  always #(1)
    if (1)
      if (id_6) id_5 <= 1;
      else id_5 <= 1;
endmodule
module module_2 (
    input tri1 id_0,
    input supply0 id_1,
    input logic id_2
);
  generate
    initial begin : LABEL_0
      id_4 <= id_2;
      $display(1, id_1);
      id_4 <= id_4 && 1'b0;
    end
    for (id_5 = (id_5 ? 1 : 1'b0) + id_1; 1; id_5 = 1'b0) begin : LABEL_0
      id_6(
          1'b0, id_5,, 1
      );
    end
  endgenerate
  module_0 modCall_1 ();
endmodule
