// Seed: 3192801202
module module_0;
  assign id_1 = 1;
  wire id_2;
endmodule
module module_1 (
    output logic id_0,
    output tri0  id_1,
    input  logic id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  tri0  id_5,
    output logic id_6,
    output logic id_7,
    input  logic id_8,
    input  tri1  id_9
);
  always begin
    fork : id_11
      if (id_5 - 1) begin
        id_0 <= {id_8{1}};
      end else begin
        id_6 <= id_2;
        `define pp_12 0
        @(id_5 or posedge 1 - id_2) @(posedge 1) id_7 = 1'b0;
        $display();
        id_7 <= 1;
        id_0 <= ~`pp_12;
      end
    join
  end
  module_0();
endmodule
