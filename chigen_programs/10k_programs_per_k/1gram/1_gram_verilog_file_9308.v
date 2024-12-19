// Seed: 2320440594
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always_latch id_4 <= id_2;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
  uwire id_5, id_6;
  always
    if (1)
      if (id_6)
        case (1)
          1: id_4 <= 1;
          id_6 && id_3: begin : LABEL_0$display
            ;
          end
        endcase
  id_7(
      .id_0(), .id_1(id_5)
  );
endmodule
