// Seed: 2216660841
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    wait (id_5);
  end
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_3;
endmodule
module module_2 (
    input wire id_0,
    input supply1 id_1,
    input tri0 id_2,
    output wire id_3,
    input wire id_4,
    input wor id_5,
    output supply1 id_6,
    input tri id_7,
    output tri1 id_8
);
  wire id_10;
  and primCall (id_6, id_7, id_11, id_4, id_0, id_2, id_5, id_10, id_1);
  wire id_11;
  always @(posedge ~id_4 or posedge 1 * 1) begin : LABEL_0
    deassign id_11;
  end
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
endmodule
