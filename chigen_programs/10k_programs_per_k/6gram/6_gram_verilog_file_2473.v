// Seed: 3482336309
module module_0 (
    input tri id_0,
    input wand id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wor id_4,
    input tri id_5,
    output supply1 id_6,
    output supply0 id_7
);
  assign id_3 = id_0;
  wire id_9;
  ;
  assign module_1.id_0 = 0;
  logic id_10;
  ;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    output logic id_2,
    output logic id_3,
    output tri id_4,
    input supply0 id_5
);
  wire id_7;
  ;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_4,
      id_5,
      id_0,
      id_4,
      id_4
  );
  assign id_3 = 1 ? id_7 : -1;
  always @(posedge id_1, id_0) begin : LABEL_0
    id_2 = -1'd0;
    id_3 <= 1;
  end
endmodule
