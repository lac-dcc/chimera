// Seed: 5181135
module module_0 ();
endmodule
module module_1 #(
    parameter id_8 = 32'd16
) (
    output supply1 id_0,
    output wire id_1,
    output tri1 id_2,
    input uwire id_3,
    output supply1 id_4,
    output logic id_5,
    input wor id_6,
    input wor id_7,
    input supply1 _id_8,
    input tri0 id_9,
    input wor id_10
);
  localparam id_12 = 1'b0;
  always @(posedge id_3 or 1) begin : LABEL_0
    fork
      wait (id_8);
      id_5 = -1 == ~id_12;
      $clog2(31);
      ;
    join_any
  end
  assign id_2 = id_7;
  module_0 modCall_1 ();
  integer [id_8 : 1] id_13;
endmodule
