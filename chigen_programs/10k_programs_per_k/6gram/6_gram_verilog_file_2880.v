// Seed: 1567460067
module module_0 (
    output logic id_0,
    output uwire id_1,
    output logic id_2
);
  wire id_4;
  assign module_1.id_1 = 0;
  initial begin : LABEL_0
    id_2 <= id_4;
    @(posedge -1) id_0 = id_4 & 1;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd87
) (
    output supply0 id_0,
    input wand _id_1,
    output logic id_2
);
  wire [id_1 : ""] id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2
  );
  assign id_4 = id_1;
  wire  id_5;
  logic id_6 = id_5;
  initial id_2 = -1 & id_1;
endmodule
