// Seed: 3095675961
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  integer id_5;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output logic id_3,
    output wire id_4
);
  assign id_4 = 1;
  wand id_6 = 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6
  );
  always id_3 = #(1'b0) 1;
endmodule
module module_2 (
    output tri id_0,
    input supply1 id_1,
    output supply1 id_2,
    input wor id_3,
    output wor id_4
);
  initial begin : LABEL_0
    id_4 = id_1 - id_3;
    if (id_1) begin : LABEL_0
      if (id_3) begin : LABEL_0
        if (1) begin : LABEL_0
          id_0 = id_3 != id_1;
        end else id_4 = id_3;
      end else assert (1);
    end
  end
  wire id_6;
  id_7(
      .id_0(id_0), .id_1(id_6), .id_2(id_1 == id_3), .id_3(id_1)
  );
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
