// Seed: 2118284776
module module_0 ();
  wire id_2, id_3;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1
);
  logic id_3;
  logic id_4;
  always @(*) begin
    id_3 = id_1;
    id_0 = id_4;
  end
  assign id_4 = id_1 ? 1 | id_3 : id_1;
  nor (id_0, id_1, id_3, id_4, id_5);
  logic id_5;
  always @(posedge {id_4,
    id_5,
    1
  })
  begin
    if ((id_4)) begin
      if (1) id_4 <= 1;
    end
  end
  module_0();
  assign id_0 = id_1;
endmodule
