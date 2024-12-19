// Seed: 2879260622
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  uwire id_7 = id_1;
  wire  id_8;
  module_2 modCall_1 ();
  wire id_9 = id_5;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 ();
  wire id_1;
endmodule
module module_3 (
    output logic id_0,
    output logic id_1
);
  assign id_0 = 1 - 1;
  initial begin : LABEL_0
    if (id_3) begin : LABEL_0
      id_1 = id_3;
      #id_4 begin : LABEL_0
        id_3 <= id_3 - id_4;
      end
      id_4 <= #1 1'h0;
    end
    id_0 <= id_3;
    id_0 <= 1;
  end
  module_2 modCall_1 ();
endmodule
