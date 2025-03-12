// Seed: 2864260833
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input tri id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    output tri1 id_6
);
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    output tri1 id_2,
    output logic id_3,
    input wor id_4,
    output supply0 id_5
);
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_1
      wait (id_0);
    end else begin : LABEL_2
      id_3 = (id_0 == 1);
    end
  end
  always @(posedge "") begin : LABEL_3
    deassign id_2.id_0;
  end
  module_0 modCall_1 (
      id_1,
      id_5,
      id_0,
      id_1,
      id_0,
      id_1,
      id_5
  );
endmodule
