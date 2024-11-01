// Seed: 3747011754
module module_0 (
    output wire id_0,
    input wand id_1,
    input supply1 id_2
);
  assign id_0 = id_1 == 1'b0;
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1,
    output supply0 id_2,
    input uwire id_3,
    input logic id_4,
    input tri id_5,
    output logic id_6
);
  always @(id_4, posedge 1) begin
    wait (1);
  end
  module_0(
      id_0, id_5, id_5
  );
  assign id_0 = 1 ? id_5 : 1 - id_5;
  always @(posedge 1 or negedge 1) begin
    if ({id_3, 1}) begin
      #(1);
      id_6 <= 1;
    end else begin
      id_6 <= id_4;
    end
  end
endmodule
