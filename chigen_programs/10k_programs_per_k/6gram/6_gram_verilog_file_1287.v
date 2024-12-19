// Seed: 644030357
module module_0;
  wire id_1;
  wire id_3;
  longint id_4;
  assign id_2 = !id_4;
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1,
    output logic id_2
);
  always @(posedge 1'b0 or posedge id_0) begin : LABEL_0
    if (id_0 > 1) begin : LABEL_0
      cover (1);
    end else disable id_4;
  end
  module_0 modCall_1 ();
  always @(id_0) begin : LABEL_0
    id_2 <= 1'b0 <= 1 ? 1'h0 : 1;
    id_1 <= id_0 - "";
  end
endmodule
