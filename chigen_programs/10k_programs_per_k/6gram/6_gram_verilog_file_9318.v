// Seed: 63132443
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1 ? id_1 : id_3;
  reg id_6 = id_6;
  always #(1) begin : LABEL_0
    if (1) begin : LABEL_0
      if (id_3) id_2 <= id_6;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  reg id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1,
      id_2
  );
  reg id_4 = id_3;
  always begin : LABEL_0
    if (1) id_3 <= "";
  end
  wire id_5;
endmodule
