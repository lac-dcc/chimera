// Seed: 1125046783
module module_0 #(
    parameter id_8 = 32'd26
) (
    output wire id_0,
    input wire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri id_4,
    output supply0 id_5
);
  assign id_4 = 1;
  task id_7(input real _id_8);
    begin : LABEL_0
      $clog2(26);
      ;
    end
  endtask
  wire [id_8 : id_8] id_9;
endmodule
module module_1 (
    output logic id_0,
    output tri   id_1,
    input  tri   id_2
);
  logic [7:0] id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
  always @(posedge id_4[1'b0] >= id_2) begin : LABEL_0
    id_0 = -1;
  end
endmodule
