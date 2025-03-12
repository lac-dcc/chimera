// Seed: 1259682658
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
  assign module_1.id_0 = 0;
  inout wire id_2;
  output wire id_1;
  always @(posedge -1)
    if (1) begin : LABEL_0
      $clog2(62);
      ;
    end
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    input tri1 id_2,
    output logic id_3,
    input supply1 id_4
);
  supply0 id_6 = -1;
  assign id_6 = id_1;
  or primCall (id_3, id_4, id_9, id_7, id_8, id_2, id_1);
  always @* begin : LABEL_0
    id_0 <= id_4;
  end
  logic id_7, id_8;
  always @(posedge id_2) id_3 = 1;
  assign id_3 = -1;
  supply1 id_9 = 1'b0;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_6,
      id_9,
      id_6
  );
endmodule
