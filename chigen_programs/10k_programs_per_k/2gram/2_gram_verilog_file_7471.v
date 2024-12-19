// Seed: 2677261495
module module_0;
  assign module_1.id_7 = "";
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_9(
      .id_0(!id_5), .id_1(0), .id_2(id_1), .id_3(id_5), .id_4(id_1), .id_5(id_4), .id_6(id_7)
  );
  wire id_10;
  always begin : LABEL_0
    case (1)
      ~id_4: $display(1, id_6);
      1: assign id_8[1 : 1] = 1'b0;
      1 && id_5: begin : LABEL_0
        id_7 = "";
      end
    endcase
  end
  wire id_11;
  wire id_12;
  assign id_4 = 1;
  module_0 modCall_1 ();
endmodule
