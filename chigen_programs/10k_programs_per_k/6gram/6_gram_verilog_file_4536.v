// Seed: 4126361374
module module_0;
  supply0 id_1;
  wire id_2;
  wire id_3;
  assign id_1 = 1;
endmodule
module module_1;
  assign id_1 = 1;
  module_0();
endmodule
module module_2 (
    output logic id_0,
    input  wand  id_1,
    input  logic id_2,
    output logic id_3,
    output wand  id_4
);
  wire id_6;
  always @(posedge 1) begin
    id_0 <= 1'b0;
    id_3 <= id_2;
  end
  wire id_7;
  module_0();
endmodule
module module_3;
  always @(posedge id_1, posedge id_1) begin
    id_1 = !id_1 && id_1;
  end
  module_0();
endmodule
