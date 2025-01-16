// Seed: 2253025054
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  wire id_5;
endmodule
module module_1 ();
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  wire id_3, id_4, id_5;
endmodule
module module_2 (
    output logic id_0,
    input  logic id_1,
    input  wor   id_2
);
  always
    if (id_1) begin : LABEL_0
      begin : LABEL_0
        begin : LABEL_0
          begin : LABEL_0
            id_0 = 1;
          end
          id_0 = id_1;
        end
        $display(id_1, -1, id_1, id_1);
        id_0 <= -1;
        id_0 = 1;
      end
    end
  wire id_4;
endmodule
macromodule module_3 (
    input tri0 id_0,
    input tri0 id_1,
    output tri id_2,
    input tri id_3,
    output logic id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wand id_7,
    input supply1 id_8,
    input logic id_9,
    input logic id_10,
    output tri id_11,
    input wire id_12
);
  wire id_14, id_15;
  id_16(
      1, 1 && id_2
  );
  module_2 modCall_1 (
      id_4,
      id_10,
      id_0
  );
  assign modCall_1.type_5 = 0;
  id_17 :
  assert property (@(1) -1) begin : LABEL_0
    id_4 <= 1;
    {1, id_10} <= id_9;
  end
endmodule
