// Seed: 798410566
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_5;
  assign id_3 = 1 ? 1 : id_5;
  assign module_1.id_3 = 0;
  wire id_6;
  assign id_1 = id_6;
  tri0 id_7;
  assign id_7 = id_4;
  always @(*) begin : LABEL_0
    if (id_7) begin : LABEL_0
      @(negedge 1) id_4 = id_4;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_10,
      id_5
  );
  reg id_11;
  always @(posedge id_1)
    if (1) $display(1);
    else id_3 <= id_11;
endmodule
