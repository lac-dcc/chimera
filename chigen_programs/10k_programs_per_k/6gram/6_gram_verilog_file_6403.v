// Seed: 716425179
module module_0 ();
  reg id_1;
  reg id_2;
  always @(posedge 1) begin
    if (id_2 < 1 || 1'b0)
      if (id_1 + id_2) begin
        if (id_2) id_1 <= 1 - 1;
        else id_2 <= 1;
      end else begin
        id_1 = 1;
      end
  end
endmodule
module module_1 (
    input  supply0 id_0,
    output logic   id_1
);
  uwire id_3;
  assign id_3 = 1;
  module_0();
  always @(id_0 or negedge 1) begin
    id_1 <= 1;
  end
endmodule
