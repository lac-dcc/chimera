// Seed: 4033063994
`timescale 1ps / 1ps
module module_0 #(
    parameter id_1 = 32'd14,
    parameter id_2 = 32'd87,
    parameter id_3 = 32'd56,
    parameter id_4 = 32'd43
) (
    input _id_1,
    output logic _id_2
);
  logic _id_3;
  logic _id_4;
  always #('b0) begin
    if (id_1) id_4 <= id_3 & 1;
    else if ("") begin
      id_1 <= 1;
      SystemTFIdentifier(id_3,, id_3);
    end else begin
      id_1 = id_3;
      #1 id_1 = 1;
      if (id_3) begin
        SystemTFIdentifier(1, 1, {1 & ~id_1, 1'b0}, 1, id_1, 1);
        forever begin
          #1 id_4 = id_3;
          id_3 <= id_2;
          SystemTFIdentifier(id_3);
          id_2 = id_1[id_1[id_4]];
          id_4[id_1#(
              .id_4(id_3[id_1 : id_1]),
              .id_2(1)
          )&id_4[id_4] : 1'b0] = id_1;
          id_4 <= id_3;
          SystemTFIdentifier(id_4);
          id_1 = 1'b0;
          wait (1);
          id_2 <= id_3;
          id_2[id_1] <= {!id_3{id_1}};
          id_1[1 : id_4] = 1'd0;
          id_4[1==id_4&1&id_3] <= id_2;
        end
      end
      id_3 = #1 1;
      SystemTFIdentifier;
    end
  end
  assign id_4 = 1 - 1;
  assign id_2[1] = 1;
  logic id_5;
  assign id_1 = id_1;
endmodule
