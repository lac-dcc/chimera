// Seed: 224789314
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  rpmos (1, id_1, 1, id_3);
  uwire id_5 = 1;
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
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  tri1 id_10;
  if (1) begin
    always_ff @(posedge 1 or id_10) id_6 = id_10;
  end else begin : id_11
    initial begin
      id_3 <= id_7;
    end
  end
  module_0(
      id_10, id_6, id_5, id_10
  );
endmodule
