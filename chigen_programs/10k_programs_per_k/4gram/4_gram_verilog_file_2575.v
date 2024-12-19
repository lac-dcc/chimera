// Seed: 4219692522
module module_0 (
    input supply1 id_0,
    input uwire   id_1
);
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    output logic id_3
);
  always @(1 or posedge 1) begin : LABEL_0
    if (1)
      if (id_1 !=? id_0) begin : LABEL_0
        id_3 <= 1;
      end
  end
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.type_1 = 0;
endmodule
module module_2 #(
    parameter id_8 = 32'd26,
    parameter id_9 = 32'd63
) (
    input  tri1 id_0,
    output wire id_1,
    input  wire id_2,
    input  tri  id_3
);
  wire id_5;
  tri1 id_6 = 1;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_1 = 0;
  defparam id_8.id_9 = 1;
endmodule
