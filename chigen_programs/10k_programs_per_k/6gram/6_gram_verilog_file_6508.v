// Seed: 993370985
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    output logic id_4,
    input tri0 id_5,
    output logic id_6,
    output logic id_7
);
  logic id_9;
  ;
  assign module_1.id_2 = 0;
  always @(*) begin : LABEL_0
    id_7 = id_0;
    id_6 <= (id_9);
    disable id_10;
    begin : LABEL_1
      id_4 = 1;
    end
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd80
) (
    output logic id_0,
    input wor _id_1,
    input supply1 id_2,
    input tri id_3
    , id_6,
    output tri id_4
);
  reg id_7;
  always @(negedge 1)
    for (id_4 = 1'b0; id_6[id_1]; id_0 = id_1)
      for (id_7 = -1; -1 == id_1; id_7 = id_6) @(posedge -1);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_2,
      id_0,
      id_3,
      id_0,
      id_0
  );
endmodule
