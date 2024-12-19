// Seed: 2320189628
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = (id_1);
  always @(posedge id_2 or posedge id_2) begin : LABEL_0
    wait (1);
  end
  wire id_5;
  id_6(
      .id_0(id_1), .id_1(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1 & id_3;
  nor primCall (id_5, id_2, id_3);
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_5
  );
endmodule
