// Seed: 3761344680
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_6, id_7;
  assign id_2 = id_2;
  assign module_1.id_1 = 0;
  supply1 id_8 = id_6;
  always @(posedge 1 or posedge 1'b0)
    if (id_3) begin : LABEL_0
      #1 id_3 = id_6;
    end
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input tri id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 id_5
);
  wire id_7;
  supply0 id_8;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_8,
      id_7
  );
  initial assume ({1, id_8});
endmodule
