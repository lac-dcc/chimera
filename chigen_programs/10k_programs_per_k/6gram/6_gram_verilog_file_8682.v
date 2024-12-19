// Seed: 2822686473
module module_0 (
    input tri id_0,
    input tri id_1,
    input supply0 id_2,
    input wand id_3,
    input wand id_4,
    input supply1 id_5
);
  assign id_7 = id_3;
  assign id_7 = id_5;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wor id_6,
    output supply1 id_7
);
  reg id_9;
  always @(id_4 == 1 or posedge 1'b0) begin : LABEL_0
    if (1'b0 == id_3) begin : LABEL_0
      id_9 <= 1;
    end else $display(1'b0);
  end
  assign id_7 = 1 ? id_3 : id_1;
  always @(id_3 == id_3 or negedge 1 == 1) begin : LABEL_0
    id_9 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_5,
      id_3
  );
endmodule
