// Seed: 587715384
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  initial begin : LABEL_0
    if (id_1) begin : LABEL_0
      if (1)
        forever begin : LABEL_0
          if (id_1)
            if (1) id_1 <= 1;
            else begin : LABEL_0
              id_1 = id_1 - 1;
            end
          else deassign id_1;
        end
      forever id_2 = id_3;
    end
  end
  static id_4(
      .id_0(id_1), .id_1(id_2), .id_2()
  );
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3
  );
endmodule
