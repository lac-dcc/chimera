// Seed: 4057455653
module module_0 #(
    parameter id_9 = 32'd29
) (
    input uwire id_0,
    output tri1 id_1,
    input tri id_2,
    output tri id_3,
    input wire id_4,
    input wire id_5,
    input supply0 id_6,
    output tri id_7
);
  assign id_3 = id_4;
  genvar _id_9;
  wire [-1 : id_9] id_10;
  assign module_1.id_0 = 0;
  wire id_11;
  ;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    output uwire id_5
);
  initial begin : LABEL_0
    id_0 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_5,
      id_2,
      id_3,
      id_4,
      id_5
  );
endmodule
