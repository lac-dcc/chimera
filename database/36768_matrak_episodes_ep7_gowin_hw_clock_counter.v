// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// Clock Counter Register

module clock_counter (
   input                clk_i,
   input                rst_i,
   input                sel_i,   // Seçim sinyali
   output [31:0]        data_o   // Veri çıkışı, işlemciye gidiyor.
);

   reg [31:0] counter_reg;

   assign data_o = sel_i ? counter_reg : 32'b0;

   always @(posedge clk_i, posedge rst_i) begin
      if (rst_i) begin
         counter_reg <= 32'b0;
      end else begin
         counter_reg <= counter_reg + 1;
      end
   end

endmodule
