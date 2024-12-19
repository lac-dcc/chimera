// Seed: 2678685431
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_1 = id_4;
  id_7(
      .id_0(id_1), .id_1(id_2), .id_2(1'b0), .id_3(id_3), .id_4(1)
  );
  initial begin : LABEL_0
    id_3 = id_2;
    id_3 = id_4;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always #1
    case (id_1)
      1:
      #1 begin : LABEL_0
        id_3 = 1'b0;
      end
      id_1 == id_1: id_2 = {1{1}};
      id_1: begin : LABEL_0
        id_2 <= 1;
      end
      1: id_3 = 1;
    endcase
  module_0 modCall_1 (
      id_1,
      id_1,
      id_5,
      id_1,
      id_1
  );
endmodule
