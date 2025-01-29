// Seed: 3188985328
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_3 = 0;
  always begin : LABEL_0
    begin : LABEL_0
      id_2 = id_3 ? -1 : id_3 - 1;
    end
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd99,
    parameter id_4 = 32'd52,
    parameter id_5 = 32'd31
) (
    id_1
);
  inout wire id_1;
  wire id_2 = id_2;
  if (id_2) defparam id_3 = -1, id_4 = 1 - 1 - -1, id_5 = -1;
  else wire id_6;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
endmodule
