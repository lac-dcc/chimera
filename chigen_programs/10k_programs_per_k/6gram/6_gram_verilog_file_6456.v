// Seed: 1579372006
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    output tri0 id_3,
    output logic id_4,
    output supply0 id_5
);
  always @(negedge !id_1) begin : LABEL_0
    #1 id_4 = 1;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    output logic id_2,
    output wand id_3,
    output tri1 id_4,
    input uwire id_5,
    input supply1 id_6,
    output logic id_7,
    input wor id_8
);
  always @(posedge id_6) begin : LABEL_0
    if (1) for (id_0 = ~id_5 << -1; id_1; id_2 = (1'b0)) @(negedge id_1);
    else begin : LABEL_1
      assume (id_5);
      id_7 <= 1;
      $unsigned(16);
      ;
    end
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_7,
      id_3
  );
endmodule
