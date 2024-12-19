// Seed: 749018165
module module_0;
  always #1 begin : LABEL_0
    deassign id_1;
  end
  assign id_2 = "" ? (1) : 1 ? id_2 : 1;
  supply0 id_4 = 1'b0;
  wire id_5;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  tri0  id_2
);
  always @(negedge id_1) begin : LABEL_0
    id_0 <= id_1 == id_0++;
  end
  assign id_0 = id_1;
  module_0 modCall_1 ();
  id_4(
      .id_0(id_2), .id_1(id_1)
  );
  wire id_5;
  wire id_6;
endmodule
