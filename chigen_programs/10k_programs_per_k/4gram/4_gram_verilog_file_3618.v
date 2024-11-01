// Seed: 1975759827
module module_0 ();
  always @(posedge 1) begin
    assume (!id_1);
  end
endmodule
module module_0 (
    module_1,
    id_1,
    id_2
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4, id_5;
  module_0();
  wire id_6;
  generate
    for (id_7 = id_7 - 1; 1'b0; id_3 = 1) begin
      always @(posedge id_6 or posedge 1) begin
        fork : id_8
          #1;
          disable id_9;
        join_any
      end
    end
  endgenerate
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  assign id_1[1] = id_3;
  module_0();
endmodule
