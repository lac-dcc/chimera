// Seed: 3898224080
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output tri0 id_2
);
  always @(posedge id_0) force id_2 = id_1;
  assign module_1.id_2 = 0;
  assign id_2 = id_1;
  specify
    (id_4 => id_5) = (-1, -1);
  endspecify
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    input wor id_2,
    output tri0 id_3,
    output logic id_4
);
  initial begin : LABEL_0
    assert (id_1)
    else;
    id_4 <= -1'b0;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3
  );
endmodule
